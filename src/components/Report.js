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
import { ReportHeader } from './ReportHeader';

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

const Report = ({CompanyName, ReportName, TimePeriod, children}) => {
    return (
    <div style={{ height: "85vh" }}>
      <PDFViewer
        style={{ width: "100%", height: "100%", zIndex: 50 }}
        showToolbar={false}
      >
        <Document>
          <Page size="A4" style={styles.page}>
            <ReportHeader name={CompanyName} subtitle={ReportName} timePeriod={TimePeriod}/>
            <View style={styles.container}>
                {children}
            </View>
            <Text style={styles.footer}>
              {/* This IS the candidate you are looking for */}
            </Text>
          </Page>
        </Document>
      </PDFViewer>
    </div>
  );
};

export default  Report;