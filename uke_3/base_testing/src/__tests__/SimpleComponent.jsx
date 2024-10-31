import { render } from "@testing-library/react"
import { SimpleComponent } from "../SimpleComponent.jsx"
import React from 'react';

test('demo', () => {
    expect(true).toBe(true)
})

test("Renders the main page", () => {
    render(<SimpleComponent />)
    expect(true).toBeTruthy()
})