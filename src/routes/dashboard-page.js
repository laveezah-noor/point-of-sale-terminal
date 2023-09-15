import React from 'react'
import { TopCards } from '../components/topCards'
import { LineChart, AreaChart } from '../components/AreaChart'

export default function DashboardPage() {
  const changePage = () => {
    window.location.href = '/newEntry';
  };
  return (
    <div className='mx-5'>
    <div className='flex items-center justify-between mx-2'>

    <div className=' px-4 pt-4 space-y-3'>
      {/* <h2 className='text-5xl font-semibold'>Dashboard</h2> */}
      <h2 className='text-4xl font-semibold'>Hi Noor</h2>
      <h2 className='text-xl text-gray-500'>Software Engineer, Full Stack Developer, and Cloud Engineer.</h2>
    </div>
    <div className='mt-6'>
      {/* <h1>Hi Clint</h1> */}
      <button 
        style={{ backgroundColor: "#775DA6" }} 
        onClick={changePage}
        class="h-12 w-40 ml-4 rounded-lg text-white">New Entry</button>
    </div>
        </div>
    <TopCards/>
    <div 
    // className='p-4 flex gap-2'
    className='grid md:grid-cols-4 grid-cols-1 gap-2 p-2'
    >
      <AreaChart/>
      <LineChart/>
    </div>
    <div 
    // className='p-4 flex gap-2'
    className='grid md:grid-cols-4 grid-cols-1 gap-2 p-2'
    >
      <AreaChart/>
      <LineChart/>
    </div>
    </div>
  )
}
