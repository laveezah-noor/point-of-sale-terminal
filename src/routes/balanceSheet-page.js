import React from 'react'

export default function BalanceSheet() {
    return (

        <div className='bg-gray-100 p-10'>
            <div className='w-3/5 mx-auto bg-white p-6 rounded-xl'>
                <div className='space-y-3'>
                    <p className='text-center text-5xl font-semibold'>Sample Balance Sheet</p>
                    <p className='text-center text-3xl font-semibold'>14-7-2023</p>
                </div>

                <div className='mt-8 border-b-2 border-black p-3'>
                    <p className='text-4xl font-semibold'>ASSETS</p>
                </div>

                <div className='mt-6 p-3 border-b-2 border-black'>
                    <p className='text-2xl font-semibold'>Current Assets</p>

                    <div className='flex justify-between mt-3'>
                        <div>
                            <p className='text-xl'>Checking Account</p>
                            <p className='text-2xl font-semibold mt-3'>Total Current Assets</p>
                        </div>
                        <div>
                            <p className='text-xl font-semibold '>5000</p>
                            <p className='text-xl font-semibold mt-3'>5000</p>
                        </div>
                    </div>
                </div>
                <div className='mt-6 p-3 border-b-2 border-black'>
                    <p className='text-2xl font-semibold'>NonCurrent Assets</p>

                    <div className='flex justify-between mt-3'>
                        <div>
                            <p className='text-xl'>Checking Account</p>
                            <p className='text-2xl font-semibold mt-3'>Total NonCurrent Assets</p>
                        </div>
                        <div>
                            <p className='text-xl font-semibold '>5000</p>
                            <p className='text-xl font-semibold mt-3'>5000</p>
                        </div>
                    </div>
                </div>
                <div className='p-3 flex justify-between border-b-2 border-black'>
                    <p className='text-2xl font-semibold mt-3'>Total Assets</p>
                    <p className='text-xl font-semibold mt-3'>10,000</p>
                </div>


                <div className='mt-8 border-b-2 border-black p-3'>
                    <p className='text-4xl font-semibold'>LIABILITIES & EQUITY</p>
                </div>

                <div className='mt-6 p-3 border-b-2 border-black'>
                    <p className='text-2xl font-semibold'>Current Liabilities</p>

                    <div className='flex justify-between mt-3'>
                        <div>
                            <p className='text-xl'>Checking Account</p>
                            <p className='text-2xl font-semibold mt-3'>Total Current Liabilities</p>
                        </div>
                        <div>
                            <p className='text-xl font-semibold '>5000</p>
                            <p className='text-xl font-semibold mt-3'>5000</p>
                        </div>
                    </div>
                </div>
                <div className='mt-6 p-3 border-b-2 border-black'>
                    <p className='text-2xl font-semibold'>NonCurrent Liabilities</p>

                    <div className='flex justify-between mt-3'>
                        <div>
                            <p className='text-xl'>Checking Account</p>
                            <p className='text-2xl font-semibold mt-3'>Total NonCurrent Liabilities</p>
                        </div>
                        <div>
                            <p className='text-xl font-semibold '>5000</p>
                            <p className='text-xl font-semibold mt-3'>5000</p>
                        </div>
                    </div>
                </div>
                <div className='mt-6 p-3 border-b-2 border-black'>
                    <p className='text-2xl font-semibold'>Equity</p>

                    <div className='flex justify-between mt-3'>
                        <div>
                            <p className='text-xl'>Checking Account</p>
                            <p className='text-2xl font-semibold mt-3'>Total Equity</p>
                        </div>
                        <div>
                            <p className='text-xl font-semibold '>5000</p>
                            <p className='text-xl font-semibold mt-3'>5000</p>
                        </div>
                    </div>
                </div>
                <div className='p-3 flex justify-between border-b-2 border-black'>
                    <p className='text-2xl font-semibold mt-3'>Total Liabilities & Equity</p>
                    <p className='text-xl font-semibold mt-3'>10,000</p>
                </div>
            </div>
        </div>
    )
}