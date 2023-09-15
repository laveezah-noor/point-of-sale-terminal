import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import axios from "axios";
import Report from "../components/Report";
import { ReportTable } from "../components/ReportTable";
import { ReportTableRow } from "../components/ReportTableRow";
import { ReportTableFooter } from "../components/ReportTableFooter";
import { ReportTableHeader } from "../components/ReportTableHeader";

export default function BalanceSheet() {
  const [data, setData] = useState([]);
  const location = useLocation();
  const { date } = location.state || "";
  const inputDate = new Date(date);
  const formattedDate = new Intl.DateTimeFormat("en-GB", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(inputDate);
  console.log(formattedDate);

  const data_list = data[1] && get_data(data[1]);
  useEffect(() => {
    axios
      .get(`http://localhost:4000/getBalanceSheet`)
      .then((response) => {
        console.log(response.data);
        setData(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);
  var columns = [
    [
      {
        name: "assets",
        id: 1,
      },
      // { name: "      ", id: "2" },
    ],
    [
      {
        name: "zxjp",
        id: 1,
      },
      // { name: "      ", id: "2" },
    ],

    // col1: ["Revenues",""],
    // col2: ["Operating Expense",""],
    // col3: ["Operating Income",""],
  ]
//   function get_data(column) {
//     columns.push(column)
//     // if (column in data) {
//     //   return data[column];
//     // } else {
//     //   return null;
//     // }
//   }

//   // Define a list of columns to retrieve data from
// //   const columns = ["Revenues", "Operating Expense", "Operating Income"];

//   // Retrieve data from columns using map() function
//   const data_list = data[0] && data[0].map(get_data);

  // Print the retrieved data
  console.log("Colss...", columns);
  function get_data(list) {
//     const assets = [];
//   const liabilities = [];
//   const equity = [];
//   const revenue = [];
//   const expenses = [];
//   for (const item of list) {
//     if (item.account_type === 'assets') {
//       assets.push(item);
//     } else if (item.account_type === 'liabilities') {
//       liabilities.push(item);
//     } else if (item.account_type === 'equity') {
//       equity.push(item);
//     } else if (item.account_type === 'revenue') {
//       revenue.push(item);
//     } else if (item.account_type === 'expenses') {
//       expenses.push(item);
//     }
//   }
//   return [assets, liabilities, equity, revenue, expenses];
const result = {};
// console.log(list);
  for (var item of list) {
    if (!result[item.account_type]) {
      result[item.account_type] = [];
    }
    result[item.account_type].push(item);
    // delete item["account_type"]
  }
  let rs = Object.values(result)
  console.log(rs)
  return rs;
  }

  // Retrieve data from columns using map() function
//   const data_list = [
//     [
//         {
//             "desc": "ad sunt culpa occaecat qui",
//             "amount": 405.89
//         },
//         {
//             "desc": "cillum quis sunt qui aute",
//             "amount": 373.11
//         },
//         {
//             "desc": "ea commodo labore culpa irure",
//             "amount": 458.61
//         }
//     ],
//     [
//         {
//             "desc": "None",
//             "amount": "None"
//         },
//         {
//             "desc": "None",
//             "amount": "None"
//         },
//         {
//             "desc": "None",
//             "amount": "None"
//         }
//     ],
//     null
// ]

  // Print the retrieved data
  console.log("DataList...", data_list);
  return (
    <Report
      CompanyName={"Luke Skywalker Company"}
      ReportName={"Balance Sheet"}
      TimePeriod={"December 24, 1999"}
    >
      <ReportTable>
        {columns.map((column, index) => {
          // console.log("Col",column);
          return (
            <>
              <ReportTableHeader headings={column}>
                {data_list &&
                    <ReportTableRow items={data_list[index]} />
                  }
              </ReportTableHeader>
              {/* <ReportTableFooter items={data.items} /> */}
            </>
          );
          // <TableHeader headings={data.column}/>
        })}
      </ReportTable>
      {/* </Report> */}
      {/* <div className="bg-gray-100 p-10">
        <div
          className="mx-auto bg-white"
          style={{ width: "8.27in", height: "11.67in", padding: "2.5cm" }}
        >
          <div className="space-y-3">
            <p className="text-center text-5xl font-semibold">
              Sample Balance Sheet
            </p>
            <p className="text-center text-3xl font-semibold">
              {formattedDate}
            </p>
          </div>

          <div className="mt-8 border-b-2 border-black p-3">
            <p className="text-4xl font-semibold">ASSETS</p>
          </div>

          <div className="mt-6 p-3 border-b-2 border-black">
            <p className="text-2xl font-semibold">Current Assets</p>

            <div className="flex justify-between mt-3">
              <div>
                <p className="text-xl">Checking Account</p>
                <p className="text-2xl font-semibold mt-3">
                  Total Current Assets
                </p>
              </div>
              <div>
                <p className="text-xl font-semibold ">5000</p>
                <p className="text-xl font-semibold mt-3">5000</p>
              </div>
            </div>
          </div>
          <div className="mt-6 p-3 border-b-2 border-black">
            <p className="text-2xl font-semibold">NonCurrent Assets</p>

            <div className="flex justify-between mt-3">
              <div>
                <p className="text-xl">Checking Account</p>
                <p className="text-2xl font-semibold mt-3">
                  Total NonCurrent Assets
                </p>
              </div>
              <div>
                <p className="text-xl font-semibold ">5000</p>
                <p className="text-xl font-semibold mt-3">5000</p>
              </div>
            </div>
          </div>
          <div className="p-3 flex justify-between border-b-2 border-black">
            <p className="text-2xl font-semibold mt-3">Total Assets</p>
            <p className="text-xl font-semibold mt-3">10,000</p>
          </div>

          <div className="mt-8 border-b-2 border-black p-3">
            <p className="text-4xl font-semibold">LIABILITIES & EQUITY</p>
          </div>

          <div className="mt-6 p-3 border-b-2 border-black">
            <p className="text-2xl font-semibold">Current Liabilities</p>

            <div className="flex justify-between mt-3">
              <div>
                <p className="text-xl">Checking Account</p>
                <p className="text-2xl font-semibold mt-3">
                  Total Current Liabilities
                </p>
              </div>
              <div>
                <p className="text-xl font-semibold ">5000</p>
                <p className="text-xl font-semibold mt-3">5000</p>
              </div>
            </div>
          </div>
          <div className="mt-6 p-3 border-b-2 border-black">
            <p className="text-2xl font-semibold">NonCurrent Liabilities</p>

            <div className="flex justify-between mt-3">
              <div>
                <p className="text-xl">Checking Account</p>
                <p className="text-2xl font-semibold mt-3">
                  Total Non Current Liabilities
                </p>
              </div>
              <div>
                <p className="text-xl font-semibold ">5000</p>
                <p className="text-xl font-semibold mt-3">5000</p>
              </div>
            </div>
          </div>
          <div className="mt-6 p-3 border-b-2 border-black">
            <p className="text-2xl font-semibold">Equity</p>

            <div className="flex justify-between mt-3">
              <div>
                <p className="text-xl">Checking Account</p>
                <p className="text-2xl font-semibold mt-3">Total Equity</p>
              </div>
              <div>
                <p className="text-xl font-semibold ">5000</p>
                <p className="text-xl font-semibold mt-3">5000</p>
              </div>
            </div>
          </div>
          <div className="p-3 flex justify-between border-b-2 border-black">
            <p className="text-2xl font-semibold mt-3">
              Total Liabilities & Equity
            </p>
            <p className="text-xl font-semibold mt-3">10,000</p>
          </div>
        </div>
      </div> */}
      {/* //{" "} */}
    </Report>
  );
}
