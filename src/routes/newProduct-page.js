import React from 'react'

export const newProductsPage = () => {
    const changePage = () => {
        window.location.href = '/newProduct';
    };
    return (
        <div>Hello</div>
    )}


export function newProductPage () {
  return (
    <div class="bg-gray-100">

    {/* <!-- *******************************************************First Section************************************************************* --> */}

    <div class="m-10 flex justify-between">
        <p class=" text-2xl font-semibold">
            <span class="text-gray-400">Products/</span>
            Create a new purchase product
        </p>
        <div class="ml-4 bg-white rounded-lg px-5 py-1 border-2 border-gray-300">
            <button>Clear</button>
        </div>
    </div>



    {/* <!-- *******************************************************DIV BOX************************************************************* --> */}

    <div class="bg-white rounded-2xl p-8 w-3/4 mx-auto">
        <div>
            <p class="text-2xl font-semibold">Product Details </p>
            <p class="text-gray-400 mt-3">Please provide details of this product</p>
        </div>

        <div class="mt-8">
            <div class="flex">
                <div class="w-3/4">
                    <p class="text-xl font-semibold">Product Name*</p>
                    <input onChange={ProductName} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl mt-5 w-96"
                        type="text" placeholder="Search product name"/>
                </div>
                <div>
                    <p class="w-1/4 text-xl font-semibold">SKU</p>
                    <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl mt-5 w-96"
                        type="text" placeholder="Search product name"/>
                    <span class="flex items-center mt-5">
                        <input onChange={} type="checkbox" class="w-5 h-5 mr-2 outline outline-1 outline-gray-400"/>
                        Auto-generate SKU
                    </span>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <p class="font-semibold">Supplier</p>
            <div class="flex items-center mt-5">
                <select class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-3/4">
                    <option value="volvo">Select a supplier</option>
                    <option value="saab">Saab</option>
                    <option value="opel">Opel</option>
                    <option value="audi">Audi</option>
                </select>
                <div class="ml-12">
                    <button style={{color: "#775DA6", border: "2px #775DA6 solid"}} class="px-4 py-2 rounded-lg bg-white">
                        New</button>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <p class="font-semibold">Product type</p>
            <div class="flex items-center mt-5">
                <select class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-3/4">
                    <option value="volvo">Select a type</option>
                    <option value="saab">Saab</option>
                    <option value="opel">Opel</option>
                    <option value="audi">Audi</option>
                </select>
                <div class="ml-12">
                    <button style={{color: "#775DA6", border: "2px #775DA6 solid"}} class="px-4 py-2 rounded-lg bg-white">
                        New</button>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <p class="font-semibold">Brand</p>
            <div class="flex items-center mt-5">
                <select class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-3/4">
                    <option value="volvo">Select a supplier</option>
                    <option value="saab">Saab</option>
                    <option value="opel">Opel</option>
                    <option value="audi">Audi</option>
                </select>
                <div class="ml-12">
                    <button style={{color: "#775DA6", border: "2px #775DA6 solid"}} class="px-4 py-2 rounded-lg bg-white">
                        New</button>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <p class="font-semibold">Product Description</p>

            <div class="mt-5 border border-gray-400 rounded-xl">
                <div class="border-b-2 p-3">
                    <select class="h-12 mt- text-lg pl-2.5 rounded-xl">
                        <option value="volvo">Headline 1</option>
                        <option value="saab">Saab</option>
                        <option value="opel">Opel</option>
                        <option value="audi">Audi</option>
                    </select>
                </div>
                <div class="p-3  pb-28">
                    <p class="text-gray-400">Describe your product...</p>
                </div>
            </div>

            <div class="mt-8">
                <div class="flex">
                    <div class="w-3/4">
                        <p class="text-xl font-semibold">Weight</p>
                        <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl mt-5 w-96"
                            type="text" placeholder="e.g 10"/>
                    </div>
                    <div>
                        <p class="w-1/4 text-xl font-semibold">Tags</p>
                        <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl mt-5 w-96"
                            type="text" placeholder="e.g 10"/>
                    </div>
                </div>
            </div>

            <div class="mt-8">
                <p class="text-2xl font-semibold">Consider how stock for this product is tracked:</p>
                <span class="flex items-center space-x-4 mt-4">
                    <input onChange={} type="checkbox" class="w-5 h-5 outline outline-1 outline-gray-400"/>
                    <p class="text-xl">Manage stock levels</p>
                </span>
                <span class="flex items-center space-x-4 mt-4">
                    <input onChange={} type="checkbox" class="w-5 h-5 outline outline-1 outline-gray-400"/>
                    <p class="text-xl">Sellable</p>
                </span>
                <span class="flex items-center space-x-4 mt-4">
                    <input onChange={} type="checkbox" class="w-5 h-5 outline outline-1 outline-gray-400"/>
                    <p class="text-xl">Batch racked</p>
                </span>
            </div>


            <div class="mt-8">
                <p class="text-2xl font-semibold">Consider how stock for this product is tracked:</p>
            </div>

            <div class="mt-5">
                <p class="font-semibold">Initial Stock*</p>
                <div class="flex items-center mt-5">
                    <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-11/12" type="text"
                        placeholder="Enter initial stock"/>
                </div>
            </div>

            <div class="mt-5">
                <p class="font-semibold">Stock Location</p>
                <div class="flex items-center mt-5">
                    <select class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-11/12">
                        <option value="volvo">Primary Location</option>
                        <option value="saab">Saab</option>
                        <option value="opel">Opel</option>
                        <option value="audi">Audi</option>
                    </select>
                </div>
            </div>

            <div class="mt-5">
                <p class="font-semibold">Initial Cost</p>
                <div class="flex items-center mt-5">
                    <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-11/12" type="text"
                        placeholder="Enter initial stock"/>
                </div>
                <p class="mt-3 text-gray-400">Initial cost is required if initial stock is a greater than zero</p>
            </div>

            <div class="mt-8">
                <p class="font-semibold">Buy Price</p>
                <div class="flex items-center mt-5">
                    <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-11/12" type="text"
                        placeholder="Enter initial stock"/>
                </div>
            </div>

            <div class="mt-5">
                <p class="font-semibold">Wholesale Price</p>
                <div class="flex items-center mt-5">
                    <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-11/12" type="text"
                        placeholder="Enter initial stock"/>
                </div>
            </div>

            <div class="mt-5">
                <p class="font-semibold">Retail Price</p>
                <div class="flex items-center mt-5">
                    <input onChange={} class="h-12 outline outline-1 outline-gray-400 text-lg pl-2.5 rounded-xl w-11/12" type="text"
                        placeholder="Enter initial stock"/>
                </div>
            </div>

            <div class="mt-12">
                <p class="text-2xl font-semibold">Consider how stock for this product is tracked:</p>
                <p class="mt-3 text-gray-400">A single variants will be created equally unless you enable the multiple
                    variant options.</p>
                <div class="mt-5 p-3 rounded-xl border border-gray-400 flex items-center space-x-4">
                    <input onChange={} type="checkbox" class="w-5 h-5 ml-3 outline outline-1 outline-gray-400"/>
                    <p class="">This product has multiple variants</p>
                </div>
            </div>

            <div class="mt-12">
                <p class="text-2xl font-semibold">Consider how stock for this product is tracked:</p>
                <p class="mt-3 text-gray-400">A single variants will be created equally unless you enable the multiple
                    variant options.</p>
                <div class="mt-5 p-3 rounded-xl border border-gray-400 flex items-center space-x-4">
                    <input onChange={} type="checkbox" class="w-5 h-5 ml-3 outline outline-1 outline-gray-400"/>
                    <p class="">This product has multiple variants</p>
                </div>
            </div>
        </div>
        <div class="mt-10">
            <button style={{backgroundColor: "#775DA6"}} class="h-10 px-4 ml-4 rounded-lg text-white">Create
                New</button>
        </div>
    </div>
    </div>
  )
}
