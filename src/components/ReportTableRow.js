import React, { Fragment } from "react";
import { TableHeaderStyles } from "./ReportTableHeader";
import { Text, View, StyleSheet } from "@react-pdf/renderer";

const databorderColor = "#90e5fc";
const TableRowStyles = StyleSheet.create({
  row: {
    flexDirection: "row",
    borderBottomColor: "#bff0fd",
    borderBottomWidth: 1,
    alignItems: "center",
    height: 24,
    fontStyle: "bold",
    flexGrow: 1,
  },
  column1: {
    // flexDirection: "row",
    width: "80%",
    textAlign: "left",
    borderRightColor: databorderColor,
    borderRightWidth: 1,
    paddingLeft: 8,
  },
  column2: {
    // flexDirection: "column",
    width: "20%",
    borderRightColor: databorderColor,
    borderRightWidth: 1,
    textAlign: "right",
    paddingRight: 8,
  },
  column3: {
    // width: TableHeaderStyles.column3.width,
    borderRightColor: databorderColor,
    borderRightWidth: 1,
    textAlign: "right",
    paddingRight: 8,
  },
  column4: {
    // flexDirection: "column",
    width: "20%",
    textAlign: "right",
    paddingRight: 8,
  },
});

export const ReportTableRow = ({ items }) => {
  // console.log(items)
  const rows = items.map((item,index) => (
    <View style={TableRowStyles.row} key={index}>
      {Object.values(item).map((value, index) => {
        let style;
        if (index === 0) {
            style = TableRowStyles.column1;
        } else if (index === Object.values(item).length - 1) {
            style = TableRowStyles.column4;
        } else {
            style = TableRowStyles.column2;
        } 
        // console.log(value,style) 
        return <Text style={style}>{value}</Text>
      })}
      {/* <Text style={TableRowStyles.column1}>{item.desc}</Text>
      <Text style={TableRowStyles.column4}>{item.amount}</Text> */}
      {/* <Text style={TableRowStyles.column3}>{item.rate}</Text> */}
      {/* <Text style={TableRowStyles.column4}>{(item.qty * item.rate).toFixed(2)}</Text> */}
    </View>
  ));
  return <Fragment>{rows}</Fragment>;
};
