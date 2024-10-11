# Oppgavesett: Interaktiv Online CV Webapplikasjon

---

## Innføring i `Components` & `Props` i React

1. **Komponenter og Props**  
    Opprett en ny komponent `Education` i en separat fil `Education.js`:
    ```jsx
    function Education({ school, degree }) {
      return (
         <div>
            <p>Skole: {school}</p>
            <p>Grad: {degree}</p>
         </div>
      );
    }
    export default Education;
    ```

2. **Hendelser og Håndtering**  
    Opprett en ny komponent `Skills` i en separat fil `Skills.js`:
    ```jsx
    function Skills({ skills }) {
      const visFerdigheter = () => {
         alert(`Ferdigheter: ${skills.join(', ')}`);
      };

      return (
         <button onClick={visFerdigheter}>Vis ferdigheter</button>
      );
    }
    export default Skills;
    ```

3. **Komponent Sammensetning**  
    Opprett en `Footer` komponent i en egen fil `Footer.js`:
    ```jsx
    function Footer({ year }) {
      return (
         <div>
            © {year} Ditt Navn
         </div>
      );
    }
    export default Footer;
    ```

4. **Props og Hendelser**  
    Modifiser `Skills` komponenten for å ta inn en ekstra prop `onSkillClick`:
    ```jsx
    function Skills({ skills, onSkillClick }) {
      return (
         <div>
            {skills.map((skill, index) => (
              <button key={index} onClick={() => onSkillClick(skill)}>
                 {skill}
              </button>
            ))}
         </div>
      );
    }
    export default Skills;
    ```

### Ekstra utfordringsoppgaver

1. **Opprett en `Projects` komponent**  
    Opprett en ny fil `Projects.js`:
    ```jsx
    function Projects({ projects }) {
      return (
         <div>
            {projects.map((project, index) => (
              <div key={index}>
                 <h3>{project.title}</h3>
                 <p>{project.description}</p>
                 <a href={project.link} target="_blank" rel="noopener noreferrer">
                    Se prosjekt
                 </a>
              </div>
            ))}
         </div>
      );
    }
    export default Projects;
    ```

2. **Endre `Skills` komponenten**  
    Oppdater `Skills` komponenten til å vise en liste over ferdigheter med en 'Slett' knapp:
    ```jsx
    function Skills({ skills, onDeleteSkill }) {
      return (
         <div>
            {skills.map((skill, index) => (
              <div key={index}>
                 <span>{skill}</span>
                 <button onClick={() => onDeleteSkill(index)}>Slett</button>
              </div>
            ))}
         </div>
      );
    }
    export default Skills;
    ```

---

## Innføring i React `Hooks: useState`

### Oppgave 1: Vis CV-informasjon

Lag en seksjon i din CV-webapplikasjon hvor brukeren kan fylle inn sin grunnleggende informasjon: `Navn`, `Alder`, og `Yrke`. Bruk `useState` for å lagre og vise denne informasjonen:
```jsx
import React, { useState } from 'react';

function App() {
  const [navn, setNavn] = useState('');
  const [alder, setAlder] = useState('');
  const [yrke, setYrke] = useState('');

  return (
     <div>
        <h1>Mitt Online CV</h1>
        <input 
          type="text" 
          placeholder="Navn" 
          value={navn} 
          onChange={(e) => setNavn(e.target.value)} 
        />
        <input 
          type="text" 
          placeholder
          placeholder="Alder" 
          value={alder} 
          onChange={(e) => setAlder(e.target.value)} 
        />
        <input 
          type="text" 
          placeholder="Yrke" 
          value={yrke} 
          onChange={(e) => setYrke(e.target.value)} 
        />
        <p>Navn: {navn}</p>
        <p>Alder: {alder}</p>
        <p>Yrke: {yrke}</p>
     </div>
  );
}
export default App;
```

### Oppgave 2: Interaktiv Ferdighetsliste

Lag en funksjon som lar brukeren legge til en liste over ferdigheter. Brukeren skal kunne skrive en ny ferdighet i et tekstfelt og legge den til i en liste ved å trykke en knapp. Bruk `useState` for å håndtere denne listen:
```jsx
import React, { useState } from 'react';

function App() {
  const [ferdighet, setFerdighet] = useState('');
  const [ferdigheter, setFerdigheter] = useState([]);

  const leggTilFerdighet = () => {
     setFerdigheter([...ferdigheter, ferdighet]);
     setFerdighet('');
  };

  return (
     <div>
        <h1>Mitt Online CV</h1>
        <input 
          type="text" 
          placeholder="Ny ferdighet" 
          value={ferdighet} 
          onChange={(e) => setFerdighet(e.target.value)} 
        />
        <button onClick={leggTilFerdighet}>Legg til ferdighet</button>
        <ul>
          {ferdigheter.map((ferdighet, index) => (
             <li key={index}>{ferdighet}</li>
          ))}
        </ul>
     </div>
  );
}
export default App;
```

### Oppgave 3: Custom Hook for CV Data

Lag en egendefinert hook kalt `useCVData` som lar deg lagre og hente CV-data. Denne hooken bør ha funksjoner for å legge til ferdigheter og oppdatere grunnleggende informasjon:
```jsx
import { useState } from 'react';

function useCVData() {
  const [cvData, setCvData] = useState({
     navn: '',
     alder: '',
     yrke: '',
     ferdigheter: []
  });

  const oppdaterInfo = (key, value) => {
     setCvData({ ...cvData, [key]: value });
  };

  const leggTilFerdighet = (ferdighet) => {
     setCvData({ ...cvData, ferdigheter: [...cvData.ferdigheter, ferdighet] });
  };

  return {
     cvData,
     oppdaterInfo,
     leggTilFerdighet
  };
}
export default useCVData;
```

### Ekstra utfordringsoppgaver

### Oppgave 4: Språk Velger

Lag en funksjon som lar brukeren velge mellom forskjellige språk for CV-en. Når et språk er valgt, skal all tekst i CVen oppdateres til det valgte språket. Hint: Du kan ha forskjellige tekststrenger lagret i en tilstand basert på valgt språk:
```jsx
import React, { useState } from 'react';

const tekster = {
  norsk: {
     tittel: 'Mitt Online CV',
     navn: 'Navn',
     alder: 'Alder',
     yrke: 'Yrke'
  },
  engelsk: {
     tittel: 'My Online CV',
     navn: 'Name',
     alder: 'Age',
     yrke: 'Occupation'
  }
};

function App() {
  const [sprak, setSprak] = useState('norsk');
  const [navn, setNavn] = useState('');
  const [alder, setAlder] = useState('');
  const [yrke, setYrke] = useState('');

  const tekst = tekster[sprak];

  return (
     <div>
        <select onChange={(e) => setSprak(e.target.value)} value={sprak}>
          <option value="norsk">Norsk</option>
          <option value="engelsk">Engelsk</option>
        </select>
        <h1>{tekst.tittel}</h1>
        <input 
          type="text" 
          placeholder={tekst.navn} 
          value={navn} 
          onChange={(e) => setNavn(e.target.value)} 
        />
        <input 
          type="text" 
          placeholder={tekst.alder} 
          value={alder} 
          onChange={(e) => setAlder(e.target.value)} 
        />
        <input 
          type="text" 
          placeholder={tekst.yrke} 
          value={yrke} 
          onChange={(e) => setYrke(e.target.value)} 
        />
        <p>{tekst.navn}: {navn}</p>
        <p>{tekst.alder}: {alder}</p>
        <p>{tekst.yrke}: {yrke}</p>
     </div>
  );
}
export default App;
```
