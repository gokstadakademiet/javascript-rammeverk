import { useState } from 'react';

export const SimpleForm = () => {
    const [formData, setFormData] = useState({
        name: '',
        email: '',
    })

    const handleChange = (e) => {
        console.log(`Event: ${e}`)

        const { name, value } = e.target
        setFormData({ ...formData, [name]: value });
    }

    const handleSubmit = (event) => {
        event.preventDefault();

        const name = event.get("name");
        const email = event.get("email");

        alert(`Du har sendt inn skjema med navn: ${name} og email: ${email}`)
    }

    return (
        <div>
            <form action={handleSubmit}>
                <div>
                    <label>Navn: </label>
                    <input
                        type="text"
                        name="name"
                        value={formData.name}
                        onChange={handleChange}
                    />
                </div>
                <div>
                    <label>Email: </label>
                    <input
                    type="text"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    />
                </div>
                <button type="submit">
                Send inn form
                </button >
            </form>
        </div>
    )
}