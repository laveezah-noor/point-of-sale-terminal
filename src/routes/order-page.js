import React from 'react'

export const OrderPage = () => {
    const changePage = () => {
        window.location.href = '/newProduct';
    };
    return (

        <div class=" bg-gray-100">
            <div className='p-16 flex justify-between'>
                <div>
                    <p class="text-4xl font-semibold"><span class="text-gray-400">Orders/</span>#CR001</p>
                </div>
                <div class="flex">
                    <select class="h-12 outline outline-1 outline-gray-400 text-lg px-4 rounded-xl w-3/4">
                        <option value="volvo">Select a supplier</option>
                        <option value="saab">Saab</option>
                        <option value="opel">Opel</option>
                        <option value="audi">Audi</option>
                    </select>

                    <div>
                        <button class="ml-4 bg-white rounded-lg h-12 w-40 border-2 border-gray-300">Clone sales order</button>
                    </div>
                    <div>
                        <button style={{ backgroundColor: "#775DA6" }} class="h-12 w-40 ml-4 rounded-lg text-white">
                            New sales order</button>
                    </div>
                </div>
            </div>

            <div className='flex space-x-10 justify-between px-16 py-12'>

                <div className='bg-white w-3/4 rounded-lg px-5 py-10'>

                    <div className='text-left'>
                        <p className='text-2xl font-semibold'>Rhombous Conference</p>
                    </div>

                    <div className='flex mt-10 space-x-5 border-t-2 border-b-2'>
                        <div className='flex py-4 w-1/2 justify-between border-r-2'>
                            <div className='space-y-4 text-gray-400 font-semibold'>
                                <p>Bill to</p>
                                <p>Bill to</p>
                                <p>Bill to</p>
                                <p>Bill to</p>
                            </div>
                            <div className='space-y-4 pr-3 font-semibold'>
                                <p>Head Office</p>
                                <p>Head Office</p>
                                <p>Head Office</p>
                                <p>Head Office</p>
                            </div>
                        </div>
                        <div className='flex first-letter py-4 w-1/2 justify-between'>
                            <div className='space-y-4 text-gray-400 font-semibold'>
                                <p>Bill to</p>
                                <p>Bill to</p>
                                <p>Bill to</p>
                                <p>Bill to</p>
                            </div>
                            <div className='space-y-4 font-semibold'>
                                <p>Head Office</p>
                                <p>Head Office</p>
                                <p>Head Office</p>
                                <p>Head Office</p>
                            </div>
                        </div>

                    </div>

                    <div class="overflow-hidden border border-gray-200 shadow-md m-5 w- mx-auto rounded-2xl">
                        <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900 flex items-center mt-3">Item Name</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Quantity</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Available</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Price($)</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Discount</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Text</th>
                                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Total($)</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                                <tr class="hover:bg-gray-50">
                                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                                        <div class="h-10 w-10">
                                            <img class=""
                                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                                alt="" />
                                        </div>
                                        <div class="text-sm">
                                            <div class="font-medium text-gray-700">Cotton Shirt</div>
                                        </div>
                                    </th>
                                    <td class="px-6 py-4 text-lg font-semibold">1</td>
                                    <td class="px-6 py-4 text-lg font-semibold">67</td>
                                    <td class="px-6 py-4">
                                        <div class="flex gap-2 text-lg font-semibold">$2300</div>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex justify-start gap-4 text-lg font-semibold">-</div>
                                    </td>
                                    <td class="px-6 py-4 text-lg font-semibold">0%</td>
                                    <td class="px-6 py-4 text-lg font-semibold">$46</td>
                                </tr>
                                <tr class="hover:bg-gray-50">
                                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                                        <div class="h-10 w-10">
                                            <img class=""
                                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                                alt="" />
                                        </div>
                                        <div class="text-sm">
                                            <div class="font-medium text-gray-700">Cotton Shirt</div>
                                        </div>
                                    </th>
                                    <td class="px-6 py-4 text-lg font-semibold">1</td>
                                    <td class="px-6 py-4 text-lg font-semibold">67</td>
                                    <td class="px-6 py-4">
                                        <div class="flex gap-2 text-lg font-semibold">$2300</div>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex justify-start gap-4 text-lg font-semibold">-</div>
                                    </td>
                                    <td class="px-6 py-4 text-lg font-semibold">0%</td>
                                    <td class="px-6 py-4 text-lg font-semibold">$46</td>
                                </tr>
                                <tr class="hover:bg-gray-50">
                                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                                        <div class="h-10 w-10">
                                            <img class=""
                                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                                alt="" />
                                        </div>
                                        <div class="text-sm">
                                            <div class="font-medium text-gray-700">Cotton Shirt</div>
                                        </div>
                                    </th>
                                    <td class="px-6 py-4 text-lg font-semibold">1</td>
                                    <td class="px-6 py-4 text-lg font-semibold">67</td>
                                    <td class="px-6 py-4">
                                        <div class="flex gap-2 text-lg font-semibold">$2300</div>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex justify-start gap-4 text-lg font-semibold">-</div>
                                    </td>
                                    <td class="px-6 py-4 text-lg font-semibold">0%</td>
                                    <td class="px-6 py-4 text-lg font-semibold">$46</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div className='flex justify-between mt-8 border-b-2 py-3 font-semibold'>
                        <p className=' text-gray-400'>Total Units </p>
                        <p>4</p>
                    </div>
                    <div className='flex justify-between mt-4 border-b-2 py-3 font-semibold'>
                        <p className=' text-gray-400'>SubTotal</p>
                        <p>4</p>
                    </div>
                    <div className='flex justify-between mt-4 border-b-2 py-3 font-semibold'>
                        <p className=' text-gray-400'>SubTotal</p>
                        <p>4</p>
                    </div>

                </div>


                <div className='w-96 rounded-lg'>
                    <div className='bg-white rounded-xl px-3 py-6 flex justify-between items-center'>
                        <p className='text-2xl font-semibold'>Order#CR0001</p>
                        <p className='text-lg font-semibold text-gray-600'>finalized</p>
                    </div>
                    <div className='bg-white rounded-xl px-3 py-10 mt-4 flex justify-between items-center'>
                        <p className='text-lg font-semibold text-gray-600'>Order#CR0001</p>
                        <p className='text-lg font-semibold text-gray-600'>$124.00</p>
                    </div>
                    <div className='bg-white rounded-xl px-3 py-10 mt-4'>
                        <div className=' flex justify-between items-center'>
                            <p className='text-lg font-semibold text-gray-600'>Payments</p>
                            <p className='text-lg text-gray-600'>$124.00 to pay</p>
                        </div>
                        <div className='mt-3'>
                            <p className='text-gray-400'>Originally from Latin, Lorem ipsum has no intelligible meaning. It is simply a display of letters to be viewed as good.</p>
                        </div>
                        <button style={{ backgroundColor: "#775DA6" }} class="h-10 w-80 mt-4 px-4 rounded-lg text-white">Mark all as paid</button>
                    </div>
                    <div className='bg-white rounded-xl px-3 py-10 mt-4'>
                        <div className=' flex justify-between items-center'>
                            <p className='text-lg font-semibold text-gray-600'>Shipments</p>
                            <p className='text-lg text-gray-600'>7 to fulfil</p>
                        </div>
                        <div className='mt-3'>
                        
                        </div>
                        <button style={{ backgroundColor: "#775DA6" }} class="h-10 w-80 mt-4 px-4 rounded-lg text-white">Mark all as paid</button>
                    </div>
                </div>

            </div>

        </div>
    )
}
