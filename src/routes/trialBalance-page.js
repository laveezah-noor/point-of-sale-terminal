import React, { Fragment, useEffect, useState } from "react";
import {
  PDFViewer,
  Page,
  Text,
  View,
  Image,
  Link,
  Font,
  Document,
  StyleSheet,
} from "@react-pdf/renderer";
import Report from '../components/Report'
import axios from "axios";

// Create styles
const styles = StyleSheet.create({
  page: {
    padding: 30,
    paddingTop: 50
  },
  section: {
    margin: 10,
    padding: 10,
    flexGrow: 1,
  },
  container: {
    flex: 1,
    flexDirection: "row",
    "@media max-width: 400": {
      flexDirection: "column",
    },
    justifyContent: 'center',
  },
  image: {
    marginBottom: 10,
  },
  leftColumn: {
    flexDirection: "column",
    width: 170,
    paddingTop: 30,
    paddingRight: 15,
    "@media max-width: 400": {
      width: "100%",
      paddingRight: 0,
    },
    "@media orientation: landscape": {
      width: 200,
    },
  },
  footer: {
    fontSize: 12,
    fontFamily: "Lato Bold",
    textAlign: "center",
    marginTop: 15,
    paddingTop: 5,
    borderWidth: 3,
    borderColor: "gray",
    borderStyle: "dashed",
    "@media orientation: landscape": {
      marginTop: 10,
    },
  },
  rowView: {
    display: 'flex', 
    flexDirection: 'row', 
    borderTop: '1px solid #EEE', 
    paddingTop: 8, 
    paddingBottom: 8, 
    textAlign: "center"
    }
});

Font.register({
  family: "Open Sans",
  src: `https://fonts.gstatic.com/s/opensans/v17/mem8YaGs126MiZpBA-UFVZ0e.ttf`,
});

Font.register({
  family: "Lato",
  src: `https://fonts.gstatic.com/s/lato/v16/S6uyw4BMUTPHjx4wWw.ttf`,
});

Font.register({
  family: "Lato Italic",
  src: `https://fonts.gstatic.com/s/lato/v16/S6u8w4BMUTPHjxsAXC-v.ttf`,
});

Font.register({
  family: "Lato Bold",
  src: `https://fonts.gstatic.com/s/lato/v16/S6u9w4BMUTPHh6UVSwiPHA.ttf`,
});

const TrialBalancePage = () => {
const data = {
  id: "5df3180a09ea16dc4b95f910",
  invoice_no: "201906-28",
  balance: "$2,283.74",
  company: "MANTRIX",
  email: "susanafuentes@mantrix.com",
  phone: "+1 (872) 588-3809",
  address: "922 Campus Road, Drytown, Wisconsin, 1986",
  trans_date: "2019-09-12",
  due_date: "2019-10-12",
  column: [
            "price",
            "email",
            "time"
        ],
  items: [
    {
      sno: 1,
      desc: "ad sunt culpa occaecat qui",
      qty: 5,
      rate: 405.89,
    },
    {
      sno: 2,
      desc: "cillum quis sunt qui aute",
      qty: 5,
      rate: 373.11,
    },
    {
      sno: 3,
      desc: "ea commodo labore culpa irure",
      qty: 5,
      rate: 458.61,
    },
    {
      sno: 4,
      desc: "nisi consequat et adipisicing dolor",
      qty: 10,
      rate: 725.24,
    },
    {
      sno: 5,
      desc: "proident cillum anim elit esse",
      qty: 4,
      rate: 141.02,
    },
  ],
};
    const [tableData, setTableData] = useState({});

    useEffect(() => {
      axios
      .get(`http://localhost:4000/getTrialBalance`)
          .then((response) => {
            console.log(response.data);
            // setData(response.data);
          })
          .catch((err)=>{
            console.log(err);
          });
        if (data !== undefined) setTableData(data);
    }, []);
    console.log(data);
    return (
      <Report 
      CompanyName={"Luke Skywalker Company"} 
      ReportName={"Trial Balance"} 
      TimePeriod={"December 24, 1999"}>
        <Table data={data}/>
      </Report>
    // <div style={{ height: "85vh" }}>
    //   <PDFViewer
    //     style={{ width: "100%", height: "100%", zIndex: 50 }}
    //     showToolbar={false}
    //   >
    //     <Document>
    //       <Page size="A4" style={styles.page}>
    //         <Header name={"Luke Skywalker Company"} subtitle={"Trial Balance"} timePeriod={"December 24, 1999"}/>
    //         <View style={styles.container}>
            // {/* {tableData &&
            //     (
            //         <Fragment>
            //             <View style={styles.rowView}>
            //                 {tableData["column"].map((c) => <Text style={{
            //                     width: `${100 / tableData["column"].length}%`
            //                 }}>{c}</Text>)}
            //             </View>
            //             {tableData["data"].map((rowData) => <>
            //                 <View style={styles.rowView}>
            //                     {tableData["column"].map((c) =>
            //                         <Text style={{ width: `${100 / tableData["column"].length}%` }}>{rowData[c]}</Text>
            //                     )}
            //                 </View>
            //             </>)}
            //         </Fragment>
            //     )} */}
            //   {/* <View style={styles.leftColumn}> */}
            //     {/* <Image
            //       src="https://react-pdf.org/static/images/luke.jpg"
            //       style={styles.image}
            //     /> */}
            //     {/* <Education /> */}
            //     {/* <Skills /> */}
            //   {/* </View> */}
            //   {/* <Experience /> */}
    //         </View>
    //         <Text style={styles.footer}>
    //           {/* This IS the candidate you are looking for */}
    //         </Text>

    //         {/* <View style={styles.section}>
    //           <Text>Section #1</Text>
    //         </View>
    //         <View style={styles.section}>
    //           <Text>Section #2</Text>
    //         </View> */}
    //       </Page>
    //     </Document>
    //   </PDFViewer>
    // </div>
  );
};

const HeaderStyles = StyleSheet.create({
  container: {
      flexDirection: "row",
      borderBottomWidth: 2,
      borderBottomColor: "#112131",
      borderBottomStyle: "solid",
      alignItems: "stretch",
    },
    detailColumn: {
    flexDirection: "column",
    flexGrow: 9,
    textAlign:'center',
},
//   linkColumn: {
    //     flexDirection: "column",
    //     flexGrow: 2,
    //     alignSelf: "flex-end",
    //     justifySelf: "flex-end",
    //   },
    name: {
        fontSize: 24,
        textTransform: "uppercase",
      fontFamily: 'Lato Bold',
      paddingBottom: 5,
  },
  subtitle: {
    fontSize: 16,
    justifySelf: "flex-end",
      fontFamily: 'Lato',
      paddingBottom: 5,
  },
  timePeriod: {
    fontSize: 14,
    justifySelf: "flex-end",
      fontFamily: 'Lato',
      paddingBottom: 5,
  },
//   link: {
//       fontFamily: 'Lato',
//     fontSize: 10,
//     color: "black",
//     textDecoration: "none",
//     alignSelf: "flex-end",
//     justifySelf: "flex-end",
//   },
});

const Header = ({name, subtitle, timePeriod}) => (
  <View style={HeaderStyles.container}>
    <View style={HeaderStyles.detailColumn}>
      <Text style={HeaderStyles.name}>{name}</Text>
      <Text style={HeaderStyles.subtitle}>{subtitle}</Text>
      <Text style={HeaderStyles.timePeriod}>{timePeriod}</Text>
    </View>
    {/* <View style={HeaderStyles.linkColumn}>
      <Link href="mailto:luke@theforce.com" style={HeaderStyles.link}>
        luke@theforce.com
      </Link> */}
    {/* </View> */}
  </View>
);

const tableRowsCount = 11;

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

  const Table = ({data}) => (
    <View style={TableStyles.tableContainer}>
        <TableHeader headings={data.column}/>
        <TableRow items={data.items} />
        <TableFooter items={data.items} />
    </View>
  );

const borderColor = '#90e5fc'
const TableHeaderStyles = StyleSheet.create({
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
    column1: {
        width: '60%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column2: {
        width: '20%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column3: {
        width: '20%',
        borderRightColor: borderColor,
        borderRightWidth: 1,
    },
    column4: {
        width: '20%'
    },
  });

  const TableHeader = ({headings}) => (
    <View style={TableHeaderStyles.container}>
        <Text style={TableHeaderStyles.column1}>Account</Text>
        <Text style={TableHeaderStyles.column2}>Debit</Text>
        {/* <Text style={TableHeaderStyles.column3}>@</Text> */}
        <Text style={TableHeaderStyles.column4}>Credit</Text>
    </View>
  );

  const databorderColor = '#90e5fc'
  const TableRowStyles = StyleSheet.create({
      row: {
          flexDirection: 'row',
          borderBottomColor: '#bff0fd',
          borderBottomWidth: 1,
          alignItems: 'center',
          height: 24,
          fontStyle: 'bold',
          flexGrow: 1
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
  
  
    const TableRow = ({items}) => {
    console.log(items)
      const rows = items.map( item => 
          <View style={TableRowStyles.row} key={item.sno.toString()}>
              <Text style={TableRowStyles.column1}>{item.desc}</Text>
              <Text style={TableRowStyles.column2}>{item.qty}</Text>
              {/* <Text style={TableRowStyles.column3}>{item.rate}</Text> */}
              <Text style={TableRowStyles.column4}>{(item.qty * item.rate).toFixed(2)}</Text>
          </View>
      )
      return (<Fragment>{rows}</Fragment> )
  };

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
    });
  
  
  const TableFooter = ({items}) => {
      const total = items.map(item => item.qty * item.rate)
          .reduce((accumulator, currentValue) => accumulator + currentValue , 0)
      return(    
          <View style={TableFooterStyles.row}>
              <Text style={TableRowStyles.column1}>TOTAL</Text>
              <Text style={TableRowStyles.column2}>{ Number.parseFloat(total).toFixed(2)}</Text>
              <Text style={TableRowStyles.column4}>{ Number.parseFloat(total).toFixed(2)}</Text>
          </View>
      )
  };
    

export default TrialBalancePage;
