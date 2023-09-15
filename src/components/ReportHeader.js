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
  });
  
export const ReportHeader = ({name, subtitle, timePeriod}) => (
    <View style={HeaderStyles.container}>
      <View style={HeaderStyles.detailColumn}>
        <Text style={HeaderStyles.name}>{name}</Text>
        <Text style={HeaderStyles.subtitle}>{subtitle}</Text>
        <Text style={HeaderStyles.timePeriod}>{timePeriod}</Text>
      </View>
    </View>
  );
  