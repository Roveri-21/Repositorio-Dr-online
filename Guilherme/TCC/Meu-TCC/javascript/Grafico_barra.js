// Obtém o elemento canvas onde o gráfico será renderizado
document.addEventListener('DOMContentLoaded', function() {
const canvas = document.getElementById('myChart');

// Cria o gráfico
new Chart(canvas, {
  type: 'bar', // Tipo de gráfico (por exemplo: 'bar', 'line', 'pie', 'doughnut', etc.)
  data: {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    datasets: [{
      label: '# of Votes',
      data: [12, 19, 3, 5, 2, 3],
      backgroundColor: ['red', 'blue', 'yellow', 'green', 'purple', 'orange'],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
});
