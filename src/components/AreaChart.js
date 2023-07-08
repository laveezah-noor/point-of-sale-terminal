import React, { useEffect, useState } from 'react'

import {
  Chart as ChartJS,
  LinearScale,
  CategoryScale,
  BarElement,
  PointElement,
  LineElement,
  Legend,
  Tooltip,
  LineController,
  BarController,
} from 'chart.js';
import { Chart, Line, Bar, Area } from 'react-chartjs-2';
import { faker } from '@faker-js/faker';

// export const AreaChart = () => {
//   return (
//     <div>AreaChart</div>
//     )
//   }

ChartJS.register(
  LinearScale,
  CategoryScale,
  BarElement,
  PointElement,
  LineElement,
  Legend,
  Tooltip,
  LineController,
  BarController
);

const labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];

// export const data = {
//   labels,
//   datasets: [
//     {
//       type: 'line' as const,
//       label: 'Dataset 1',
//       borderColor: 'rgb(255, 99, 132)',
//       borderWidth: 2,
//       fill: false,
//       data: labels.map(() => faker.datatype.number({ min: -1000, max: 1000 })),
//     },
//     {
//       type: 'area' as const,
//       label: 'Dataset 2',
//       backgroundColor: 'rgb(75, 192, 192)',
//       data: labels.map(() => faker.datatype.number({ min: -1000, max: 1000 })),
//       borderColor: 'white',
//       borderWidth: 2,
//     },
//     {
//       type: 'bar' as const,
//       label: 'Dataset 3',
//       backgroundColor: 'rgb(53, 162, 235)',
//       data: labels.map(() => faker.datatype.number({ min: -1000, max: 1000 })),
//     },
//   ],
// };



export function AreaChart() {
  const [lineData, setLineData] = useState({
    datasets:[]
  });
  const [chartOptions, setChartOptions] = useState({})

  useEffect(() => {
    setLineData({
      labels: labels,
      datasets: [
        {
          type: 'line',
          fill: true,
      label: 'Dataset 1',
      data: labels.map(() => faker.datatype.number({ min: 0, max: 1000 })),
      borderColor: 'rgb(53, 162, 235)',
      backgroundColor: 'rgba(53, 162, 235, 0.5)',
      //     fill: true,
      //     label: 'Sales $',
      //     data: labels.map(() => faker.datatype.number({ min: 0, max: 1000 })),
      //     borderColor: 'rgb(53, 162, 235)',
      //     backgroundColor: 'rgba(53, 162, 235, 0.5)',
        },
        {
          type: 'bar',
          fill: true,
      label: 'Dataset 2',
      data: labels.map(() => faker.datatype.number({ min: 0, max: 1000 })),
      borderColor: 'rgb(53, 162, 235)',
      backgroundColor: 'rgba(53, 162, 235, 0.5)',
      //     fill: true,
      //     label: 'Sales $',
      //     data: labels.map(() => faker.datatype.number({ min: 0, max: 1000 })),
      //     borderColor: 'rgb(53, 162, 235)',
      //     backgroundColor: 'rgba(53, 162, 235, 0.5)',
        }
      ]
    })
    setChartOptions({
      responsive: true,
      plugins:{
        legend: {
          position:'top'
        },
        title:{
          display: true,
          text: 'Daily Revenue'
        }
      },
      maintainAspectRatio: false,
      responsive: true
    })
  }, [])
    return (
    <div 
    className='w-full md:col-span-2 relative h-[50vh] m-auto p-4 border rounded-lg bg-white' 
    >
      <Chart type='bar' data={lineData} />
    </div>
)}

export function LineChart() {
  const [lineData, setLineData] = useState({
    datasets:[]
  });
  const [chartOptions, setChartOptions] = useState({})

  useEffect(() => {
    setLineData({
      labels: labels,
      datasets: [
        {
          label: 'Sales $',
          data: labels.map(() => faker.datatype.number({ min: 0, max: 1000 })),
          borderColor: 'blue'
        }
      ]
    })
    setChartOptions({
      plugins:{
        legend: {
          position:'top'
        },
        title:{
          display: true,
          text: 'Daily Revenue'
        }
      },
      maintainAspectRatio: false,
      responsive: true
    })
  }, [])
    return (
    <div 
    className='w-full md:col-span-2 relative h-[50vh] m-auto p-4 border rounded-lg bg-white' 
    >
      <Line data={lineData} options={chartOptions}/>
    </div>
)}
