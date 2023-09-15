import React from 'react'
import {
    Text,
    View,
    StyleSheet,
  } from "@react-pdf/renderer";

export const ReportTableHeader = ({headings, children}) => {
//     const numberOfItems = headings.length;

//   let className;
//   if (numberOfItems = 1) {
//     className = TableHeaderStyles.column1;
//   } else if (numberOfItems < 10) {
//     className = "class2";
//   } else {
//     className = "class3";
//   }
// console.log(headings);
  const rows = headings.map((item,index)=>{
    let style;
    if (index === 0) {
        style = TableHeaderStyles.column1;
    } else if (index === Object.values(item).length - 1) {
        style = TableHeaderStyles.column4;
    } else {
        style = TableHeaderStyles.column2;
    } 
    if (headings.length === 1){
        style = TableHeaderStyles.column0;
    }
    // console.log(item,style) 
//   <div className={className}>
//       {data.map((item) => (
    return <Text 
        style={style} 
        key={index}>{item.name}</Text>
    //   ))}
    // </div>
  })
  
    return(
        <>
    <View key={0} style={TableHeaderStyles.container}>
        {rows}
        {/* <Text style={TableHeaderStyles.column1}>Account</Text> */}
        {/* <Text style={TableHeaderStyles.column2}>Debit</Text> */}
        {/* <Text style={TableHeaderStyles.column3}>@</Text> */}
        {/* <Text style={TableHeaderStyles.column4}>Credit</Text> */}
    </View>
        {children}
        </>
)}

const borderColor = '#90e5fc'
export const TableHeaderStyles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        borderBottomColor: '#bff0fd',
        backgroundColor: '#bff0fd',
        borderBottomWidth: 1,
        alignItems: 'center',
        height: 24,
        textAlign: 'center',
        fontStyle: 'bold',
        flexGrow: 1,
    },
    column0: {
        textAlign: 'left',
        paddingLeft: 8,
        width: '100%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column1: {
        flexGrow:4,
        flex:4,
        // width: '60%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column2: {
        // width: '20%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column3: {
        // width: '20%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column4: {
        flex:1,
        // width: '20%'
    },
  });

