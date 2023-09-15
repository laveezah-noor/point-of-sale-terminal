import React from 'react';
import { createBoard } from '@wixc3/react-board';
import DashboardPage from '../../../routes/dashboard-page';

export default createBoard({
    name: 'DashboardPage',
    Board: () => <DashboardPage />
});
