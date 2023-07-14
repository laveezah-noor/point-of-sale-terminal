import React from 'react'

export default function NewEntryPage() {

    return (
        <div class=" bg-gray-100">
            <div className='p-16 pb-5 flex justify-between '>
                <div className='flex justify-between flex-col'>
                    <p class="text-4xl font-semibold"><span class="text-gray-400">New Entry</span></p>
                <p class=" text-xl text-gray-900">
                    Create a new entry
                </p>  
                </div>
            <div class="px-16 block ">
                <div class="ml-4 bg-white rounded-lg px-5 py-1 border-2 border-gray-300">
                    <button>Clear</button>
                </div>
            </div>
            </div>

            <div class="bg-white rounded-2xl p-8 w-3/4 mx-auto">
                <div>
                    <p class="text-2xl font-semibold">Entry Details </p>
                    <p class="text-gray-400 mt-3">Please provide details of this entry</p>
                </div>

                <div class="mt-8">
                    <div class="flex">
                        <div class="w-3/4">
                            <p class="text-xl font-semibold">Date*</p>
                            <input class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl mt-5 w-96"
                                type="text" placeholder="Enter Date" />
                        </div>
                       </div>
                </div>
                
                <div class="mt-6">
                    <p class="font-semibold">Product Description</p>
                    <textarea rows='10' cols='90' className='border-2 p-3 mt-4 rounded-xl'>Enter Description...</textarea>
                
                    <div class="mt-8">
                        <div class="flex">
                            <div class="w-1/2">
                                <p class="text-xl font-semibold">Account</p>
                                <input class="h-12 w-3/4 outline outline-1 outline-gray-400 mt-4 text-lg pl-2.5 rounded-xl" type="email"
                                    placeholder="Enter Account" />
                            </div>
                            <div className='w-1/2'>
                                <p class="text-xl font-semibold">Entry type</p>
                                <select class="h-12 mt-4 outline outline-1 outline-gray-400 text-lg px-4 rounded-xl">
                                    <option value="volvo">Enter Type</option>
                                    <option value="saab">xyz@gmail.com</option>
                                    <option value="opel">abc@gmail.com</option>
                                    <option value="audi">123@gmail.com</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div className='mt-8'>
                        <p className='text-xl font-semibold'>Amount</p>
                        <input class="h-12 outline outline-1 outline-gray-400 mt-4 text-lg pl-2.5 rounded-xl w-1/2" type="text"
                            placeholder="Enter Amount$" />
                    </div>
                </div>
                <div class="mt-10">
                    <button style={{ backgroundColor: "#775DA6" }} class="h-10 px-4 ml-4 rounded-lg text-white">Create
                        </button>
                </div>
            </div>
        </div>
    )
}
