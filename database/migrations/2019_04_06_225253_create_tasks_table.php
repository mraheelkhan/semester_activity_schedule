<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('semester_id');
            $table->string('task_title');
            $table->string('task_type')->comment('general, teachers, students');
            $table->string('task_status')->nullable();
            $table->date('task_date');
            $table->date('task_due_date')->nullable();
            $table->string('isDeleted')->default(0);
            $table->string('status')->default('active');
            $table->integer('created_by');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tasks');
    }
}
