<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Gate;
use Hash;
use App\User;
use App\Batch;
use App\Program;
class NotificationController extends Controller
{
    public function create(){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)  || Gate::allows('onlyAdminTeacher', $user)){
            $batches = Batch::all();
            $programs = Program::where('status', 'active')->get();
            return view('notifications.create')->with('batches', $batches)->with('programs', $programs);  
        } else{
            //return "you are not authorize to this action";
            return view('forbidden');
        }
    }
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|max:255',
            'description' => 'required',
        ]);

        $input = array_except($request->all(),array('_token'));

        $this->Post->AddData($input);

        $notification = \DB::table('api_users')->get();

        foreach ($notification as $key => $value) {
            $this->notification($value->token, $request->get('title'));
        }

        \Session::put('success','Post store and send notification successfully!!');

        return redirect()->route('post.index');
    }


    public function notification(Request $request)
    {
        $fcmUrl = 'https://fcm.googleapis.com/fcm/send';
        // $token=$token;

        $notification = array(
            'task_title' => $request->title,
            'task_details' => $request->description,
            "click_action" => "TaskNotification",
            // 'sound' => true,
        );
        $batch = $request->batch_id;
        $topic = "/topics/" . $batch;
        
        $extraNotificationData = ["message" => $notification,"moredata" =>'dd'];

        $fcmNotification = [
            //'registration_ids' => $tokenList, //multple token array
            'to'        => '/topics/11', //single token
            //'notification' => $notification,
            'data' => $notification
        ];
        $server_key = "AAAABJg8ad0:APA91bF4ibM0aOfz7meaTOCeyiNvZ2C0y7xt5QdwwlZBvaNOwm78DUOLjXLg5OYfTQ-UqmGUPS9Or0HQeLbnXm9QcXwrQygGS0TQhh61f6W87vKVm-6IYTbKRjuvLA3IOMEW28WzitCo";
        $headers = [
            'Authorization: key=' . $server_key,
            'Content-Type: application/json'
        ];


        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
        $result = curl_exec($ch);
        curl_close($ch);

        return redirect()->back();
    }
}
