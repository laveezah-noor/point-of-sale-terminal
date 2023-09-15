import React from 'react'
import Report from '../components/Report'
import { ReportTable } from '../components/ReportTable'

const ownerEquityPage = () => {
  return (
    <Report 
    CompanyName={"Luke Skywalker Company"} 
    ReportName={"Statement of Owner's Equity"} 
    TimePeriod={"December 24, 1999"}>
        <ReportTable>
            
        </ReportTable>
    </Report>
  )
}

export default ownerEquityPage