import React from 'react'
import { createBoard } from '@wixc3/react-board';

export default createBoard({
    name: 'New Board',
    Board: () => <div></div>,
    environmentProps: {
        canvasWidth: 2302,
        windowHeight: 1837,
        windowWidth: 2328
    }
});
