window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            # labels: ["Red", "Blue", "Yellow", "Green", "Purple"], #①ラベルをユーザーの名前にする
            labels: gon.user_name, #①ラベルをユーザーの名前にする
            datasets: [{
                label: '# 平均ポイント',
                # data: [5, 4, 3, 2, 1], #②データをユーザーのポイント平均点に変更する
                data: [gon.datas], #②データをユーザーのポイント平均点に変更する
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 5,
                        suggestedMin: 1,
                        beginAtZero:true
                    }
                }]
            }
        }
    })