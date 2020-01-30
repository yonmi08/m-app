$(document).ready(function() {
  $('#calendar').fullCalendar({
    // navLinks: true,
    // selectable: true,
    // selectHelper: true,
    eventResizableFromStart: true,
    // select: function(start, end) {
    //   var title = prompt('イベントを追加');
    //   var eventData;
    //   if (title) {
    //     eventData = {
    //       title: title,
    //       start: start,
    //       end: end
    //     };
    //     $('#calendar').fullCalendar('renderEvent', eventData, true);
    //   }
    //   $('#calendar').fullCalendar('unselect');
    // },
    titleFormat: 'YYYY年 M月',
    //曜日を日本語表示
    dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
    //ボタンのレイアウト
    header: {
        left: 'title',
        center: '',
        right: 'today prev,next'
    },
    defaultTimedEventDuration: '03:00:00',
    buttonText: {
        prev: '前',
        next: '次',
        prevYear: '前年',
        nextYear: '翌年',
        today: '今日',
        month: '月',
        week: '週',
        day: '日'
    },
    timeFormat: "HH:mm",
    eventColor: '#fcc',
    eventTextColor: '#4d3c42',
    events: location.pathname,
    // editable: true
  });
});