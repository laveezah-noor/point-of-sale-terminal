import React, { useState } from 'react'

export default function NewEntryPage() {
  const [entry, setEntry] = useState({
    date: '',
    account:'',
    type:'',
    description: '',
  });
  const [date, setDate] = useState('');
  const [description, setDescription] = useState('Enter Description...');
  const [account, setAccount] = useState('');
  const [accountList, setAccountList] = useState(["Assets"]);
  const [entryType, setEntryType] = useState('');
  const [amount, setAmount] = useState('');
  const [isAccountHidden,setIsAccountHidden] = useState(false);
  const toggleAccountDropdown = () =>{
    setIsAccountHidden(!isAccountHidden)
  }
  const onClickDate = (item)=>{
    setDate(item)
    console.log(date);
  }
  const onClickDescription = (item)=>{
    setDescription(item)
    console.log(description);
  }
  const onClickAccount = (item)=>{
    setAccount(item)
    console.log(account);
  }
  const onClickEntry = (item)=>{
    setEntryType(item)
    console.log(entryType);
  }
  const onClickAmount = (item)=>{
    setAmount(item)
    console.log(amount);
  }
  const onCreate = ()=>{
    setEntry({
      date: date,
      account: account,
      description: description,
      type: entryType,
      amount: parseFloat(amount),
      
    })
    console.log(entry);
  }
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
                            <input class="h-12 outline outline-1 outline-gray-400 text-lg px-2.5 rounded-xl mt-5 w-96"
                                type="date" placeholder="Enter Date" value={date}
                                onChange={(e)=>onClickDate(e.target.value)} />
                        </div>
                       </div>
                </div>
                
                <div class="mt-6">
                    <p class="font-semibold">Product Description</p>
                    <textarea rows='10' cols='90' className='border-2 p-3 mt-4 rounded-xl' onChange={(e)=>onClickDescription(e.target.value)}>{description}</textarea>
                
                    <div class="mt-8">
                        <div class="flex">
                            <div class="w-1/2">
                                <p class="text-xl font-semibold">Account</p>
                                
                                
                                <button  
                                // class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" 
                                className='h-12 w-3/4 mt-4 outline outline-1 outline-gray-400 text-lg px-4 rounded-xl justify-between font-small py-2.5 text-center inline-flex items-center'
                                onClick={toggleAccountDropdown}
                                type="button"> Choose Account Type
                                <svg class="w-2.5 h-2.5 ml-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                                  </svg></button>
                                {/* <!-- Dropdown menu --> */}
                                <div id="dropdown" class={`z-10 bg-white divide-y divide-gray-100 rounded-lg shadow w-44  ${isAccountHidden ? 'hidden' : ''}`}>
                                    <ul class="py-2 text-sm text-gray-700 " aria-labelledby="dropdownDefaultButton">
                                      {accountList.map((item) => {
                                      return<li>
                                        <a onClick={()=>onClickAccount(item)}  class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-white">{item}</a>
                                      </li>
                                      })}
                                      
                                    </ul>
                                </div>

                            </div>
                            <div className='w-1/2'>
                                <p class="text-xl font-semibold">Entry Type</p>
                                <div class="flex items-center mt-4">
                                  <input id="default-radio-1" type="radio" value="D" onClick={()=>onClickEntry('D')} name="default-radio" class="w-4 h-4 text-blue-600  focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"/>
                                  <label for="default-radio-1" class="ml-2 text-sm font-medium text-gray-900 ">Debit</label>
                              </div>
                              <div class="flex items-center mt-2">
                                  <input checked id="default-radio-2" type="radio" value="C" onClick={()=>onClickEntry('C')} name="default-radio" class="w-4 h-4 text-blue-600  focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"/>
                                  <label for="default-radio-2" class="ml-2 text-sm font-medium text-gray-900 ">Credit</label>
                              </div>
                                {/* <select class="h-12 mt-4 outline outline-1 outline-gray-400 text-lg px-4 rounded-xl">
                                    <option value="D">Debit</option>
                                    <option value="C">Credit</option>
                                </select> */}
                            </div>
                        </div>
                    </div>
                    <div className='mt-8'>
                        <p className='text-xl font-semibold'>Amount</p>
                        <input 
                        value={amount}
                        onChange={(e)=>onClickAmount(e.target.value)}
                        class="h-12 outline outline-1 outline-gray-400 mt-4 text-lg pl-2.5 rounded-xl w-1/2" type="text"
                            placeholder="Enter Amount" />
                    </div>
                </div>
                <div class="mt-10">
                    <button
                    onClick={()=>onCreate()}
                    style={{ backgroundColor: "#775DA6" }} class="h-10 px-4 ml-4 rounded-lg text-white">Create
                        </button>
                </div>
            </div>
        </div>
    )
}
