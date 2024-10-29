import { useState, useEffect } from 'react';

const SkillsComponent = () => {
    const [skills, setSkills] = useState(['React', 'Javascript', 'CSS']);

    useEffect(() => {
        setTimeout(() => {
            console.log(`Skills: ${skills.map(skill => skill)}`)
        }, 3000)
    })

    return (
        <div>
            <ul>
                {skills.map((skills, index) => {
                    return <li key={index}>{skills}</li>
                })}
            </ul>
            <button onClick={() => setSkills([...skills, `skill-${skills.length}`])}>Add Skill</button>
        </div>
    )
}

export default SkillsComponent;