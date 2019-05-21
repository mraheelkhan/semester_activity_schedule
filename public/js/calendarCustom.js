$(function() {
    /* initialize the external events
     -----------------------------------------------------------------*/
    function init_events(ele) {
        ele.each(function() {
            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data("eventObject", eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 1070,
                revert: true, // will cause the event to go back to its
                revertDuration: 0 //  original position after the drag
            });
        });
    }

    init_events($("#external-events div.external-event"));

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    $("#calendar").fullCalendar({
        header: {
            left: "prev,next today",
            center: "title",
            // right : 'month,agendaWeek,agendaDay'
            right: "month"
        },
        buttonText: {
            today: "today",
            month: "month",
            week: "week",
            day: "day"
        },

        //Random default events
        events: events,
        eventTextColor: "#ffffff",
        editable: false,
        droppable: false
        // this allows things to be dropped onto the calendar !!!
    });

    
});
