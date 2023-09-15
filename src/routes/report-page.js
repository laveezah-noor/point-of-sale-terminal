import React, { useState } from "react";
import { Link } from "react-router-dom";

export const ReportPage = () => {
  const [isBalanceHidden, setIsBalanceHidden] = useState(false);
  const [isTrialHidden, setIsTrialHidden] = useState(false);
  // const [isEquityHidden, setIsEquityHidden] = useState(false);
  const [date, setDate] = useState(new Date());

  const toggleBalanceModal = () => {
    setIsBalanceHidden(!isBalanceHidden);
  };
  const toggleTrialModal = () => {
    setIsTrialHidden(!isTrialHidden);
  };


  return (
    <div>
      <div className="flex md:flex-row lg:flex-col justify-between p-16">
        <div className="">
          <p className="text-6xl font-semibold">Reports</p>
        </div>
        {/* Balance Sheet */}
        <div className="bg-white flex flex-col justify-between border px-5 py-10 mt-10 rounded-lg">
          <div className="flex justify-between">
            {/* <!-- Modal toggle --> */}
            <div className="flex w-full items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
              <h3 className="text-xl font-semibold text-gray-900 dark:text-gray">
                Balance Sheet
              </h3>
              <button
                onClick={toggleBalanceModal}
                data-modal-target="defaultModal"
                data-modal-toggle="defaultModal"
                // bg-blue-700 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800
                className={`block text-gray-900 
                 focus:ring-4 focus:outline-none  font-medium rounded-lg text-sm px-2 py-2.5 text-center `}
                type="button"
              >
                <svg
                  className="w-2.5 h-2.5"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 10 6"
                >
                  <path
                    stroke="currentColor"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="2"
                    d="m1 1 4 4 4-4"
                  />
                </svg>
                <span className="sr-only">Open modal</span>
              </button>
            </div>
          </div>

          {/* <!-- Main modal --> */}
          <div
            id="defaultModal"
            tabIndex="-1"
            aria-hidden="true"
            className={`z-50 w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full ${
              isBalanceHidden ? "hidden" : ""
            }`}
          >
            <div className="relative w-full max-w-2xl max-h-full">
              {/* <!-- Modal content --> */}
              {/* dark:bg-gray-700 */}
              <div className="relative bg-white">
                {/* <!-- Modal body --> */}
                <div className="p-6 space-y-6">
                  <div>
                    <p className="w-1/4 text-xl font-semibold">At Date</p>
                    <input
                      className="h-12 outline outline-1 outline-gray-400 text-lg px-2.5 rounded-xl mt-5 w-96"
                      type="date"
                      placeholder="Enter Date"
                      value={date}
                      onChange={(e) => {
                        setDate(e.target.value);
                        console.log(date);
                      }}
                    />
                  </div>
                </div>
                {/* <!-- Modal footer --> */}
                <div className="flex items-center p-6 space-x-2 border-gray-200 rounded-b dark:border-gray-600">
                  <Link
                    // onClick={()=>console.log(date)}
                    to={{ pathname: "/balanceSheet"}} state={{ date }}
                    data-modal-hide="defaultModal"
                    type="button"
                    className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                  >
                    Generate
                  </Link>
                  <button
                    data-modal-hide="defaultModal"
                    type="button"
                    className="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600"
                  >
                    Clear
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Trial Balance */}
        <div className="bg-white flex flex-col justify-between border px-5 py-10 mt-10 rounded-lg">
          <div className="flex justify-between">
            {/* <!-- Modal toggle --> */}
            <div className="flex w-full items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
              <h3 className="text-xl font-semibold text-gray-900 dark:text-gray">
                Trial Balance
              </h3>
              <button
                onClick={toggleTrialModal}
                data-modal-target="defaultModal"
                data-modal-toggle="defaultModal"
                // bg-blue-700 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800
                className={`block text-gray-900 
                 focus:ring-4 focus:outline-none  font-medium rounded-lg text-sm px-2 py-2.5 text-center `}
                type="button"
              >
                <svg
                  className="w-2.5 h-2.5"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 10 6"
                >
                  <path
                    stroke="currentColor"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="2"
                    d="m1 1 4 4 4-4"
                  />
                </svg>
                <span className="sr-only">Open modal</span>
              </button>
            </div>
          </div>

          {/* <!-- Main modal --> */}
          <div
            id="defaultModal"
            tabIndex="-1"
            aria-hidden="true"
            className={`z-50 w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full ${
              isTrialHidden ? "hidden" : ""
            }`}
          >
            <div className="relative w-full max-w-2xl max-h-full">
              {/* <!-- Modal content --> */}
              {/* dark:bg-gray-700 */}
              <div className="relative bg-white">
                {/* <!-- Modal body --> */}
                <div className="p-6 space-y-6">
                  <div>
                    <p className="w-1/4 text-xl font-semibold">At Date</p>
                    <input
                      className="h-12 outline outline-1 outline-gray-400 text-lg px-2.5 rounded-xl mt-5 w-96"
                      type="date"
                      placeholder="Enter Date"
                      value={date}
                      onChange={(e) => setDate(e.target.value)}
                    />
                    
                  </div>
                </div>
                {/* <!-- Modal footer --> */}
                <div className="flex items-center p-6 space-x-2 border-gray-200 rounded-b dark:border-gray-600">
                  <Link
                    to={{ pathname: "/balanceSheet", state: new Date() }}
                    data-modal-hide="defaultModal"
                    type="button"
                    className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                  >
                    Generate
                  </Link>
                  <button
                    data-modal-hide="defaultModal"
                    type="button"
                    className="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600"
                  >
                    Clear
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
