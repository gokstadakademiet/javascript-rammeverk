# Oppgavesett: Interaktiv Online CV Webapplikasjon - Uke 1 - Løsningsforslag og forklaring

##  Innføring i introduksjon til `React`

### **Header.js**
```javascript
import React from 'react';

const Header = ({ imageUrl, name }) => (
  <div>
    <h1>Mitt Online CV</h1>
    <img src={imageUrl} alt={name} width='200' />
  </div>
);
export default Header;
```
**Forklaring:** 
`Header`-komponenten er en funksjonskomponent som mottar `imageUrl` og `name` som props. Denne komponenten viser en tittel og et bilde. ES6 destrukturering er brukt for å hente ut verdiene fra props, noe som gjør koden mer konsis.

### **PersonalInfo.js**
```javascript
import React from 'react';

const PersonalInfo = ({ name, address, phone, email }) => (
  <div>
    <p>Navn: {name}</p>
    <p>Adresse: {address}</p>
    <p>Telefon: {phone}</p>
    <p>E-post: {email}</p>
  </div>
);
export default PersonalInfo;
```
**Forklaring:** 
`PersonalInfo`-komponenten viser personlig informasjon om brukeren. Ved å benytte destrukturering trekker vi ut de spesifikke detaljene vi trenger fra props.

### **SkillsButton.js**
```javascript
import React from 'react';

const SkillsButton = ({ onClick }) => (
  <button onClick={onClick}>
    Vis detaljer
  </button>
);
export default SkillsButton;
```
**Forklaring:** 
`SkillsButton`-komponenten er en knappkomponent som mottar en `onClick` funksjon gjennom props. Denne funksjonen vil bli utløst når brukeren klikker på knappen.

### **App.js (Modified)**
```javascript
import React from 'react';
import './App.css';
import Header from './Header';
import PersonalInfo from './PersonalInfo';
import SkillsButton from './SkillsButton';

const App = () => {
  const personalDetails = {
    name: 'Ola Nordmann',
    imageUrl: 'path_to_image.jpg',
    address: 'Osloveien 123, 1234 Oslo',
    phone: '12345678',
    email: 'ola@nordmann.no'
  };

  const showDetails = () => {
    alert('Ferdigheter:\n- Webutvikling\n- Apputvikling\n- Databaseforvaltning');
  }

  return (
    <div className='App'>
      <Header name={personalDetails.name} imageUrl={personalDetails.imageUrl} />
      <PersonalInfo 
        name={personalDetails.name}
        address={personalDetails.address}
        phone={personalDetails.phone}
        email={personalDetails.email}
      />
      <SkillsButton onClick={showDetails} />
    </div>
  );
}
export default App;
```
**Forklaring:** 
`App`-komponenten samler alle de tidligere definerte komponentene. `personalDetails` objektet inneholder dummydata for en bruker. `showDetails` funksjonen er definert for å vise en alert med ferdighetene når 'Vis detaljer' knappen blir klikket. Deretter bruker vi `Header`, `PersonalInfo`, og `SkillsButton` komponentene, og passerer de nødvendige props til dem for å vise informasjonen.

---

## Innføring i `Components` & `Props` i React

### **Education.js**
```javascript
import React from 'react';

const Education = ({ school, degree }) => (
  <div>
    <h2>Utdanning</h2>
    <p>Skole: {school}</p>
    <p>Grad: {degree}</p>
  </div>
);

export default Education;
```
**Forklaring:** 
`Education`-komponenten er en funksjonskomponent som tar inn to props: `school` og `degree`, og returnerer en `div` med skolens navn og graden. 

### **Skills.js**
```javascript
import React from 'react';

const Skills = ({ skills, onSkillClick }) => {
  const handleSkillClick = (skill) => {
    onSkillClick(skill);
  }

  return (
    <div>
      <h2>Ferdigheter</h2>
      <ul>
        {skills.map((skill, index) => (
          <li key={index} onClick={() => handleSkillClick(skill)}>
            {skill}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Skills;
```
**Forklaring:** 
`Skills`-komponenten er modifisert for å ta inn en ekstra prop `onSkillClick`. Dette er en funksjon som blir kalt når en enkelt ferdighet i listen blir klikket. `handleSkillClick` funksjonen kaller `onSkillClick` funksjonen med den klikkede ferdigheten.

### **Footer.js**
```javascript
import React from 'react';

const Footer = ({ year }) => (
  <div>
    © {year} Ditt Navn
  </div>
);

export default Footer;
```
**Forklaring:** 
`Footer`-komponenten er en funksjonskomponent som tar inn en prop `year`, og returnerer en `div` med teksten '© [year] Ditt Navn'.

### **Ekstra utfordringsoppgaver Løsning**

### **Projects.js**
```javascript
import React from 'react';

const Projects = ({ projects }) => (
  <div>
    <h2>Prosjekter</h2>
    <ul>
      {projects.map((project, index) => (
        <li key={index}>
          <h3>{project.title}</h3>
          <p>{project.description}</p>
          <a href={project.link} target='_blank' rel='noopener noreferrer'>Se Prosjekt</a>
        </li>
      ))}
    </ul>
  </div>
);

export default Projects;
```
**Forklaring:** 
`Projects`-komponenten tar inn en `projects` prop som er en array av prosjektobjekter og returnerer en liste med alle prosjektene med en link til prosjektet.

### **Skills.js (Modified Again)**
```javascript
import React, { useState } from 'react';

const Skills = ({ skills: initialSkills }) => {
  const [skills, setSkills] = useState(initialSkills);

  const handleDelete = (index) => {
    const newSkills = skills.slice();
    newSkills.splice(index, 1);
    setSkills(newSkills);
  }

  return (
    <div>
      <h2>Ferdigheter</h2>
      <ul>
        {skills.map((skill, index) => (
          <li key={index}>
            {skill}
            <button onClick={() => handleDelete(index)}>Slett</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Skills;
```
**Forklaring:** 
I den modifiserte `Skills`-komponenten har vi lagt til en lokal state `skills` og en `handleDelete` funksjon som fjerner en ferdighet fra listen når 'Slett' knappen blir klikket.

### **App.js**
```javascript
import React from 'react';
import Education from './Education';
import Skills from './Skills';
import Footer from './Footer';
import Projects from './Projects';

const App = () => {
  const education = {
    school: 'Universitetet i Oslo',
    degree: 'Master i Informatikk'
  };

  const skills = ['JavaScript', 'React', 'Node.js'];

  const projects = [
    {
      title: 'Prosjekt 1',
      description: 'Dette er beskrivelsen av prosjekt 1',
      link: 'https://www.example.com'
    },
    {
      title: 'Prosjekt 2',
      description: 'Dette er beskrivelsen av prosjekt 2',
      link: 'https://www.example.com'
    }
  ];

  const handleSkillClick = (skill) => {
    alert(`${skill} er klikket!`);
  };

  return (
    <div>
      <Education school={education.school} degree={education.degree} />
      <Skills skills={skills} onSkillClick={handleSkillClick} />
      <Projects projects={projects} />
      <Footer year={new Date().getFullYear()} />
    </div>
  );
}

export default App;
```
**Forklaring:** 
`App`-komponenten importerer alle de andre komponentene og bruker dem til å lage en fullstendig applikasjon. `education`, `skills`, og `projects` er definert som konstanter og sendt som props til de tilsvarende komponentene. `handleSkillClick` funksjonen er definert i `App`-komponenten og sendt som prop til `Skills`-komponenten.


## Innføring i React `Hooks: useState`

### **Løsning Oppgave 1:**
```javascript
import React, { useState } from 'react';

const CVInfo = () => {
  const [name, setName] = useState('');
  const [age, setAge] = useState('');
  const [profession, setProfession] = useState('');

  return (
    <div>
      <input placeholder='Navn' onChange={e => setName(e.target.value)} />
      <input placeholder='Alder' onChange={e => setAge(e.target.value)} />
      <input placeholder='Yrke' onChange={e => setProfession(e.target.value)} />
      <div>
        <strong>Navn:</strong> {name} <br />
        <strong>Alder:</strong> {age} <br />
        <strong>Yrke:</strong> {profession}
      </div>
    </div>
  );
}
```

**Forklaring:**
Vi benytter `useState` hook for å opprette og håndtere tilstander for `Navn`, `Alder` og `Yrke`. Ved å fylle ut input-feltene, blir verdien av hvert felt satt til tilhørende tilstand ved hjelp av `onChange`-eventen.

### **Løsning Oppgave 2:**
```javascript
import React, { useState } from 'react';

const Skills = () => {
  const [skill, setSkill] = useState('');
  const [skillsList, setSkillsList] = useState([]);

  const addSkill = () => {
    setSkillsList([...skillsList, skill]);
    setSkill('');
  }

  return (
    <div>
      <input 
        placeholder='Ferdighet' 
        value={skill} 
        onChange={e => setSkill(e.target.value)} 
      />
      <button onClick={addSkill}>Legg til</button>
      <ul>
        {skillsList.map((skill, index) => <li key={index}>{skill}</li>)}
      </ul>
    </div>
  );
}
```

**Forklaring:**
Vi bruker to `useState`-hooks; en for å holde styr på den nåværende ferdigheten som skrives inn og en for å holde styr på den totale listen over ferdigheter. Når 'Legg til'-knappen klikkes, legges den nåværende ferdigheten til i listen og input-feltet renses.

### **Løsning Oppgave 3:**
```javascript
import { useState } from 'react';

const useCVData = () => {
  const [data, setData] = useState({
    name: '',
    age: '',
    profession: '',
    skills: []
  });

  const updateBasicInfo = (name, age, profession) => {
    setData(prev => ({ ...prev, name, age, profession }));
  }

  const addSkill = skill => {
    setData(prev => ({ ...prev, skills: [...prev.skills, skill] }));
  }

  return { data, updateBasicInfo, addSkill };
}
```

**Forklaring:**
Den egendefinerte `useCVData`-hooken gir en måte å sentralisere og administrere CV-data ved hjelp av `useState`-hook. Den gir også funksjoner for å oppdatere grunnleggende informasjon og legge til ferdigheter.

### **Løsning Oppgave 4:**
```javascript
import React, { useState } from 'react';

const LanguageSelector = () => {
    const [language, setLanguage] = useState('no'); // default språk
    const translations = {
        no: {
            title: 'Min CV',
            skills: 'Ferdigheter',
        },
        en: {
            title: 'My CV',
            skills: 'Skills',
        }
    };

    const currentTranslation = translations[language];

    return (
        <div>
            <select value={language} onChange={(e) => setLanguage(e.target.value)}>
                <option value='no'>Norsk</option>
                <option value='en'>English</option>
            </select>
            <h1>{currentTranslation.title}</h1>
            <h2>{currentTranslation.skills}</h2>
            {/* Resten av CV innhold her */}
        </div>
    );
}
```

**Forklaring:**
I denne løsningen bruker vi `useState` for å holde styr på det valgte språket. Vi setter standard språket til norsk (`'no'`). Deretter oppretter vi et objekt kalt `translations` som inneholder nøkkel-verdi-par for oversettelser på de forskjellige språkene vi støtter (i dette tilfellet norsk og engelsk).

For å vise den riktige oversettelsen basert på det valgte språket, henter vi den aktuelle oversettelsen fra `translations` objektet ved hjelp av den valgte språknøkkelen (enten `'no'` eller `'en'`). Vi bruker deretter denne oversettelsen for å vise den aktuelle teksten i komponenten.

Brukeren kan bytte språk ved å velge et annet språk fra rullegardinlisten (`<select>` elementet). Når brukeren bytter språk, oppdateres `language` tilstandsvariabelen med den nye verdien, og komponenten rendrer på nytt med den aktuelle oversettelsen.

Dette er en grunnleggende tilnærming til lokalisering av en webapplikasjon. I et virkelig prosjekt ville du kanskje ha brukt biblioteker som `react-i18next` for en mer sofistikert løsning.