import React from 'react'

export const ProductsPage = () => {
    const changePage = () => {
        window.location.href = '/newProduct';
      };
  return (
    <div>
    <nav class="sm:h-20 flex items-center sm:flex sm:justfy-between sm:flex-row flex-col bg-white">
        <div class="flex items-center ml-4 bg-gray-100 rounded-lg w-80 h-10 p-5 sm:mt-0 mt-3">
            <i class="fa-solid fa-magnifying-glass opacity-50 text-lg"></i>
            <input class="bg-gray-100 outline-0 text-lg pl-2.5" type="text" placeholder="Search..."/>
        </div>
        <ul class="px-2 py-4 flex space-x-4">
            <li><i class="fa-solid fa-question bg-gray-500 rounded-full py-1 px-2 mt-2 text-white"></i></li>
            <li><i class="fa-solid fa-bell mx-2 mt-1 text-2xl text-gray-500"></i></li>
            <li><img src="https://media.istockphoto.com/id/1399611777/photo/portrait-of-a-smiling-little-brown-haired-boy-looking-at-the-camera-happy-kid-with-good.jpg?s=2048x2048&w=is&k=20&c=nyOxOKJQvvUOXIZ1s7mPF4zUySY1eKBIl88Vbwi7wLA="
                    class="h-10 rounded-full"/></li>
            <p class="text-sm"> <span class="font-bold">Saad Sohail</span> <br/> Web Developer</p>
        </ul>
    </nav>
    <hr class="border-gray-400"/>





    <div class="flex m-24 md:flex-row flex-col items-center justify-between">

        <div class="">
            <p class="text-6xl font-semibold">Products</p>
        </div>

        <div class="flex">
            <div class="box flex bg-white items-center ml-4 rounded-lg h-10 p-5 border-2 border-gray-300">
                <i class="fa-solid fa-magnifying-glass opacity-50 text-lg"></i>
                <input class="h-10 outline-0 text-lg pl-2.5 w-[23rem]" type="text"
                    placeholder="Search product name, supplier, type or tags..."/>
            </div>

            <div class="flex items-center ml-4 bg-white rounded-lg px-4 h-10 border-2 border-gray-300">
                <i class="fa-filter fa-solid opacity-50 mr-4 text-lg"></i>
                <button>Filter</button>
            </div>
            <div>
                <button onClick={changePage} style={{backgroundColor: "#775DA6;"}} class="h-10 px-4 ml-4 rounded-lg text-white">Create
                    New</button>
            </div>
        </div>

    </div>


    <div class="text-gray-400 text-xl flex space-x-5 ml-24">
        <p>Active</p>
        <p>All product</p>
    </div>
    <br/>
    <hr class="border-gray-400 w-11/12 mx-auto"/>



    <div class="w-11/12 bg-white mt-14 mx-auto flex items-center rounded-2xl">
        <div class="px-12 py-8">
            <p class="text-3xl font-bold">Bring in your products and stock levels</p>
            <p class="text-gray-400 w-7/12 mt-5">All of your products will be managed here. Manually create products or
                import products using a spreadsheet. You can also sync products from your eCommerce store.</p>
        </div>
        <div class="px-12">
            <button style={{color: "#775DA6", border: "2px #775DA6 solid"}} class="ml-4 w-36 py-3 rounded-lg bg-white">
                Add a product</button>
        </div>
    </div>




    {/* <!-- ******************************************************** TABLE ******************************************************* --> */}




    <div class="overflow-hidden border border-gray-200 shadow-md m-5 w-11/12 mx-auto rounded-2xl">
        <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
            <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900 flex items-center mt-3">
                        <input
                            type="checkbox" class="w-5 h-5 mr-2 outline outline-1 outline-gray-400"/> Name</th>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Supplier</th>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Product Type</th>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Brand</th>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Batch tracked</th>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Available</th>
                    <th scope="col" class="px-6 py-4 font-medium text-gray-900">Status</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>

                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vintta Supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vintta Supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vintta Supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vintta Supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vintta Supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vintta Supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vinta supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vinta supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vinta supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <th class="flex gap-3 px-6 py-4 font-normal text-gray-900 items-center">
                        <input type="checkbox" class=" w-5 h-5"/>
                        <div class="relative h-10 w-10">
                            <img class="h-full w-full rounded-full object-cover object-center"
                                src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                alt="" />
                            <span
                                class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-700">Steven Jobs</div>
                            <div class="text-gray-400">jobs@sailboatui.com</div>
                        </div>
                    </th>
                    <td class="px-6 py-4">
                        Vinta supplier
                    </td>
                    <td class="px-6 py-4">Product</td>
                    <td class="px-6 py-4">
                        <div class="flex gap-2">
                            <p>Vinta</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex justify-start gap-4">
                            <p>No</p>
                        </div>
                    </td>
                    <td class="px-6 py-4">12 in 1 variants</td>
                    <td class="px-6 py-4">
                        <button
                            class="inline-flex items-center gap-1 rounded-full bg-violet-50 px-2 py-1 text-xs font-semibold text-violet-600">
                            Active
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
  )
}
