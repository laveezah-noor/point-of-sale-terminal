import React from 'react'

import {
    View,
    StyleSheet,
  } from "@react-pdf/renderer";

export const ReportTable = ({children}) => {
  return (
    <View style={TableStyles.tableContainer}>
        {children}
    </View>
  )
}

const TableStyles = StyleSheet.create({
    tableContainer: {
        flexDirection: 'row',
        flexWrap: 'wrap',
        marginTop: 24,
        // borderWidth: 1,
        // borderColor: '#bff0fd',
        // width: "500px"
    },
});
