import React from "react";
import Report from "../components/Report";
import { ReportTable } from "../components/ReportTable";
import { ReportTableHeader } from "../components/ReportTableHeader";
import { ReportTableRow } from "../components/ReportTableRow";
import { ReportTableFooter } from "../components/ReportTableFooter";

const IncomeStatementPage = () => {
  const data = {
    columns: [
      [
        {
          name: "Revenues",
          id: 1,
        },
        // { name: "      ", id: "2" },
      ],
      [
        {
          name: "Operating Expense",
          id: 1,
        },
        // { name: "      ", id: "2" },
      ],

      // col1: ["Revenues",""],
      // col2: ["Operating Expense",""],
      // col3: ["Operating Income",""],
    ],
    "Revenues": [
      {
        desc: "ad sunt culpa occaecat qui",
        amount: 405.89,
      },
      {
        desc: "cillum quis sunt qui aute",
        amount: 373.11,
      },
      {
        desc: "ea commodo labore culpa irure",
        amount: 458.61,
      },
    ],
    "Operating Expense": [
      {"desc": "None", "amount": "None"},
      {"desc": "None", "amount": "None"},
      {"desc": "None", "amount": "None"},
  ],
  };
  // Define a function to retrieve data from columns
  function get_data(column) {
    if (column in data) {
      return data[column];
    } else {
      return null;
    }
  }

  // Define a list of columns to retrieve data from
  const columns = ["Revenues", "Operating Expense", "Operating Income"];

  // Retrieve data from columns using map() function
  const data_list = columns.map(get_data);

  // Print the retrieved data
  console.log("DataList...", data_list);

  return (
    <Report
      CompanyName={"Luke Skywalker Company"}
      ReportName={"Income Statement"}
      TimePeriod={"December 24, 1999"}
    >
      <ReportTable>
        {data.columns.map((column, index) => {
          console.log("Col",column);
          return (
            <>
              <ReportTableHeader headings={column}>
                {data_list[index] &&
                    <ReportTableRow items={data_list[index]} />
                  }
              </ReportTableHeader>
              {/* <ReportTableFooter items={data.items} /> */}
            </>
          );
          // <TableHeader headings={data.column}/>
        })}
      </ReportTable>
    </Report>
  );
};

export default IncomeStatementPage;
