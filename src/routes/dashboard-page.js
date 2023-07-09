import React from 'react'
import { TopCards } from '../components/topCards'
import { LineChart, AreaChart } from '../components/AreaChart'

export default function DashboardPage() {
  return (
    <>
    <div className='flex justify-between px-4 pt-4'>
      <h2>Dashboard</h2>
      <h2>Welcome Back, Clint</h2>
    </div>
    <div>
      
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
    </>
  )
}
