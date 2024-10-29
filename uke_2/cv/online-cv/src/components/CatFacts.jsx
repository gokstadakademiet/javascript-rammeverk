export const CatFacts = ({ texts }) => {

    return (
        <div>
            <h2>Cat Facts</h2>
            <ul>
               {
                texts.map((text, index) => {
                    return <li key={index}>{text}</li>
                })
               } 
            </ul>
        </div>
    )
}