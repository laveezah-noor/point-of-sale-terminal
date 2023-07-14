import React, { useState } from 'react'

export const ReportPage = () => {
    const [isHidden,setIsHidden] = useState(false);
    const toggleModal = () =>{
        setIsHidden(!isHidden)
    }
  return (
    <div>
        <div class="flex md:flex-row lg:flex-col justify-between p-16">
            <div class="">
                <p class="text-6xl font-semibold">Reports</p>
            </div>
            {/* Balance Sheet */}
            <div className='bg-white flex flex-col justify-between border px-5 py-10 rounded-lg'>
                <div className='flex justify-between'>
                {/* <!-- Modal toggle --> */}
                <div class="flex w-full items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-gray">
                    Balance Sheet
                    </h3>
                {/* <p class="text-2xl font-semibold">Balance Sheet</p> */}
                <button 
                onClick={toggleModal}
                data-modal-target="defaultModal" data-modal-toggle="defaultModal" 
                // bg-blue-700 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800
                className={`block text-gray-900 
                 focus:ring-4 focus:outline-none  font-medium rounded-lg text-sm px-2 py-2.5 text-center `} type="button">
                    <svg class="w-2.5 h-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                    </svg>
                    <span class="sr-only">Open modal</span>
                </button>
                </div>

                </div>

                {/* <!-- Main modal --> */}
                <div id="defaultModal" tabindex="-1" aria-hidden="true" 
                className={`z-50 w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full ${isHidden ? 'hidden' : ''}`}>
                    <div class="relative w-full max-w-2xl max-h-full">
                        {/* <!-- Modal content --> */}
                        {/* dark:bg-gray-700 */}
                        <div class="relative bg-white">
                            {/* <!-- Modal header --> */}
                            {/* <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                    Terms of Service
                                </h3>
                                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="defaultModal">
                                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                    </svg>
                                </button>
                            </div> */}
                            {/* <!-- Modal body --> */}
                            <div class="p-6 space-y-6">
                            <div>
                    <p class="w-1/4 text-xl font-semibold">At Date</p>
                    <input class="h-12 outline outline-1 outline-gray-400 text-lg px-2 rounded-xl mt-5 w-96"
                        type="date" placeholder="Search product name"/>
                </div>
                            </div>
                            {/* <!-- Modal footer --> */}
                            <div class="flex items-center p-6 space-x-2 border-gray-200 rounded-b dark:border-gray-600">
                                <button data-modal-hide="defaultModal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Generate</button>
                                <button data-modal-hide="defaultModal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">Clear</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
  )
}
