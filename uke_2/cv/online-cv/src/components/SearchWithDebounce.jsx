import { useState, useEffect } from 'react';
import { API_URL } from '../App';

export const SearchWithDebounce = () => {
    const [searchTerm, setSearchTerm] = useState('');
    const [results, setResult] = useState([]);

    useEffect(() => {
        const handler = setTimeout(() => {
            if (searchTerm) {
                fetch(`${API_URL}?animal_type=${searchTerm}`)
                .then(response => response.json())
                .then(data => {
                    setResult(data)
                })
                .catch(error => console.error(error))
            }
        }, 1000)

        return () => clearTimeout(handler)
    }, [searchTerm])

    return (
        <div>
            <input
                type="text"
                value={searchTerm}
                onChange={e => setSearchTerm(e.target.value)}
                placeholder="Search for cat facts"
            />

            <ul>
                {results.length == 0 && results.map((result, index) => {
                    return <li key={index}>{result}</li>
                })}
            </ul>
        </div>
    )
}