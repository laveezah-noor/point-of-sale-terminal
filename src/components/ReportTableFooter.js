import React from 'react'
import {TableHeaderStyles} from './ReportTableHeader'
import {
    Text,
    View,
    StyleSheet,
  } from "@react-pdf/renderer";

const databorderColor = '#90e5fc'
const footerBorderColor = '#90e5fc'
const TableFooterStyles = StyleSheet.create({
    row: {
        flexDirection: 'row',
        borderBottomColor: '#bff0fd',
        borderBottomWidth: 1,
        alignItems: 'center',
        height: 24,
        fontSize: 14,
        fontStyle: 'bold',
    },
    description: {
        width: '60%',
        // textAlign: 'right',
        borderRightColor: footerBorderColor,
        borderRightWidth: 1,
        paddingRight: 8,
    },
    total: {
        width: '20%',
        textAlign: 'right',
        paddingRight: 8,
        borderRightColor: footerBorderColor,
        borderRightWidth: 1,
    },
    column1: {
        width: TableHeaderStyles.column1.width,
        textAlign: 'left',
        borderRightColor: databorderColor,
        borderRightWidth: 1,
        paddingLeft: 8,
    },
    column2: {
      width: TableHeaderStyles.column2.width,
        borderRightColor: databorderColor,
        borderRightWidth: 1,
        textAlign: 'right',
        paddingRight: 8,
    },
    column3: {
      width: TableHeaderStyles.column3.width,
        borderRightColor: databorderColor,
        borderRightWidth: 1,
        textAlign: 'right',
        paddingRight: 8,
    },
    column4: {
      width: TableHeaderStyles.column4.width,
        textAlign: 'right',
        paddingRight: 8,
    },

  });



  export const ReportTableFooter = ({items}) => {
    const total = items.map(item => item.qty * item.rate)
        .reduce((accumulator, currentValue) => accumulator + currentValue , 0)
    return(    
        <View style={TableFooterStyles.row}>
            <Text style={TableFooterStyles.column1}>Total</Text>
            <Text style={TableFooterStyles.column2}>{ Number.parseFloat(total).toFixed(2)}</Text>
            <Text style={TableFooterStyles.column4}>{ Number.parseFloat(total).toFixed(2)}</Text>
        </View>
    )
};