document.addEventListener('DOMContentLoaded', function() {
    // Obtém o elemento canvas onde o gráfico de rosquinha será renderizado
    const donutCanvas = document.getElementById('donutChart');
  
    // Cria o gráfico de rosquinha
    new Chart(donutCanvas, {
      type: 'doughnut', // Tipo de gráfico de rosquinha
      data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: ['red', 'blue', 'yellow', 'green', 'purple', 'orange'],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        cutout: '70%', // Tamanho do buraco no meio da rosquinha (70%)
        plugins: {
          legend: {
            position: 'bottom'
          }
        }
      }
    });
  });
  