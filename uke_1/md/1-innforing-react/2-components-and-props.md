## Innføring i `Components` & `Props` i React

### Oppgave 1: Oppsett av Prosjektstruktur

> [!NOTE]  
> For å holde prosjektet organisert, skal vi opprette en mappe kalt `components` i prosjektets rotkatalog. Denne mappen vil inneholde alle våre React-komponenter. Å ha en dedikert mappe for komponenter gjør det enklere å vedlikeholde og navigere i prosjektet.

1. **Opprett en `components` mappe**  

   ```bash
   mkdir components
   ```

### Oppgave 2: Komponenter og Props

1. **Opprett en ny komponent `Education`**  
   Lag en ny fil `components/Education.js` som tar inn props `school` og `degree`. Komponenten skal returnere en div med to paragrafer for henholdsvis `school` og `degree`:

   ```jsx
   // components/Education.js
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

   > [!TIP]
   > Husk å eksportere komponenten slik at den kan importeres i andre filer.

   **Inkluder `Education` i `App`**  
   Oppdater `App.js` til å inkludere `Education` komponenten:

   ```jsx
   // App.js
   import React from 'react';
   import Education from './components/Education';

   function App() {
     return (
       <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
       </div>
     );
   }

   export default App;
   ```

### Oppgave 3: Hendelser og Håndtering

1. **Opprett en ny komponent `Skills`**  
   Lag en ny fil `components/Skills.js` som tar inn en liste av ferdigheter som props. Komponenten skal vise en knapp som, når klikket, viser ferdighetene i en alert:

   ```jsx
   // components/Skills.js
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

   **Inkluder `Skills` i `App`**  
   Oppdater `App.js` til å inkludere `Skills` komponenten:

   ```diff
   import React from 'react';
   import Education from './components/Education';
   +import Skills from './components/Skills';
   
   function App() {
      return (
   +    <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
   +      <Skills skills={['JavaScript', 'React', 'Node.js']} />
      </div>
      );
   }
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // App.js
   import React from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';

   function App() {
     return (
       <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={['JavaScript', 'React', 'Node.js']} />
       </div>
     );
   }

   export default App;
   ```
   </details>

### Oppgave 4: Komponent Sammensetning

1. **Opprett en `Footer` komponent**  
   Lag en ny fil `components/Footer.js` som tar inn prop `year`. Komponenten skal returnere en div som viser © {year} Ditt Navn:

   ```jsx
   // components/Footer.js
   function Footer({ year }) {
     return (
       <div>
         © {year} Ditt Navn
       </div>
     );
   }
   export default Footer;
   ```

   **Inkluder `Footer` i `App`**  
   Oppdater `App.js` til å inkludere `Footer` komponenten:

   ```diff
   import React from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';
   +import Footer from './components/Footer';
   
   function App() {
      return (
   @@ -9,6 +10,7 @@ function App() {
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={['JavaScript', 'React', 'Node.js']} />
   +      <Footer year={2024} />
      </div>
      );
   }
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // App.js
   import React from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';
   import Footer from './components/Footer';

   function App() {
     return (
       <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={['JavaScript', 'React', 'Node.js']} />
         <Footer year={2024} />
       </div>
     );
   }

   export default App;
   ```
   </details>

### Oppgave 5: Props og Hendelser

1. **Modifiser `Skills` komponenten**  
   Oppdater `Skills` komponenten til å ta inn en ekstra prop `onSkillClick`. Komponenten skal vise en liste over ferdigheter som knapper, og når en knapp klikkes, skal `onSkillClick` funksjonen kalles med ferdigheten som argument:

   ```diff
   -function Skills({ skills }) {
   -    const visFerdigheter = () => {
   -      alert(`Ferdigheter: ${skills.join(', ')}`);
   -    };
   -  
   +function Skills({ skills, onSkillClick }) {
      return (
   -      <button onClick={visFerdigheter}>Vis ferdigheter</button>
   +      <div>
   +        {skills.map((skill, index) => (
   +          <button key={index} onClick={() => onSkillClick(skill)}>
   +            {skill}
   +          </button>
   +        ))}
   +      </div>
      );
      }
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // components/Skills.js
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

   </details>

   <br></br>

   **Inkluder oppdatert `Skills` i `App`**  
   Oppdater `App.js` til å inkludere den oppdaterte `Skills` komponenten:

   ```diff
   function App() {
   +  const handleSkillClick = (skill) => {
   +    alert(`Du klikket på: ${skill}`);
   +  };
   +
      return (
      <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
   -      <Skills skills={['JavaScript', 'React', 'Node.js']} />
   +      <Skills skills={['JavaScript', 'React', 'Node.js']} onSkillClick={handleSkillClick} />
         <Footer year={2024} />
      </div>
      );
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // App.js
   import React from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';
   import Footer from './components/Footer';

   function App() {
     const handleSkillClick = (skill) => {
       alert(`Du klikket på: ${skill}`);
     };

     return (
       <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={['JavaScript', 'React', 'Node.js']} onSkillClick={handleSkillClick} />
         <Footer year={2024} />
       </div>
     );
   }

   export default App;
   ```

   </details>

### Ekstra utfordringsoppgaver

1. **Opprett en `Projects` komponent**  
   Lag en ny fil `components/Projects.js` som tar inn en liste av prosjekter som props. Komponenten skal vise prosjektene med tittel, beskrivelse og en lenke:

   ```jsx
   // components/Projects.js
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

   **Inkluder `Projects` i `App`**  
   Oppdater `App.js` til å inkludere `Projects` komponenten:

   ```diff
   import Education from './components/Education';
   import Skills from './components/Skills';
   import Footer from './components/Footer';
   +import Projects from './components/Projects';
   
   function App() {
      const handleSkillClick = (skill) => {
      alert(`Du klikket på: ${skill}`);
      };
   
   +  const projects = [
   +    { title: 'Prosjekt 1', description: 'Beskrivelse av prosjekt 1', link: 'http://example.com' },
   +    { title: 'Prosjekt 2', description: 'Beskrivelse av prosjekt 2', link: 'http://example.com' },
   +  ];
   +
      return (
      <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={['JavaScript', 'React', 'Node.js']} onSkillClick={handleSkillClick} />
   +      <Projects projects={projects} />
         <Footer year={2024} />
      </div>
      );
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // App.js
   import React from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';
   import Footer from './components/Footer';
   import Projects from './components/Projects';

   function App() {
     const handleSkillClick = (skill) => {
       alert(`Du klikket på: ${skill}`);
     };

     const projects = [
       { title: 'Prosjekt 1', description: 'Beskrivelse av prosjekt 1', link: 'http://example.com' },
       { title: 'Prosjekt 2', description: 'Beskrivelse av prosjekt 2', link: 'http://example.com' },
     ];

     return (
       <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={['JavaScript', 'React', 'Node.js']} onSkillClick={handleSkillClick} />
         <Projects projects={projects} />
         <Footer year={2024} />
       </div>
     );
   }

   export default App;
   ```

   </details>

   <br></br>

2. **Endre `Skills` komponenten**  
   Oppdater `Skills` komponenten til å vise en liste over ferdigheter med en 'Slett' knapp. Når knappen klikkes, skal `onDeleteSkill` funksjonen kalles med indeksen til ferdigheten som argument:

   ```diff
   -function Skills({ skills, onSkillClick }) {
   +function Skills({ skills, onDeleteSkill }) {
      return (
         <div>
            {skills.map((skill, index) => (
   -          <button key={index} onClick={() => onSkillClick(skill)}>
   -            {skill}
   -          </button>
   +          <div key={index}>
   +            <span>{skill}</span>
   +            <button onClick={() => onDeleteSkill(index)}>Slett</button>
   +          </div>
            ))}
         </div>
      );
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // components/Skills.js
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

   </details>

   <br></br>

   **Inkluder oppdatert `Skills` i `App`**  
   Oppdater `App.js` til å inkludere den oppdaterte `Skills` komponenten:

   ```diff
   +import React, { useState } from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';
   import Footer from './components/Footer';
   import Projects from './components/Projects';
   
   function App() {
   +  const [skills, setSkills] = useState(['JavaScript', 'React', 'Node.js']);
   +
      const handleSkillClick = (skill) => {
      alert(`Du klikket på: ${skill}`);
      };
   
   +  const handleDeleteSkill = (index) => {
   +    setSkills(skills.filter((_, i) => i !== index));
   +  };
   +
      const projects = [
      { title: 'Prosjekt 1', description: 'Beskrivelse av prosjekt 1', link: 'http://example.com' },
      { title: 'Prosjekt 2', description: 'Beskrivelse av prosjekt 2', link: 'http://example.com' },
   @@ -19,7 +24,7 @@ function App() {
      <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
   -      <Skills skills={['JavaScript', 'React', 'Node.js']} onSkillClick={handleSkillClick} />
   +      <Skills skills={skills} onSkillClick={handleSkillClick} onDeleteSkill={handleDeleteSkill} />
         <Projects projects={projects} />
         <Footer year={2024} />
      </div>
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   // App.js
   import React, { useState } from 'react';
   import Education from './components/Education';
   import Skills from './components/Skills';
   import Footer from './components/Footer';
   import Projects from './components/Projects';

   function App() {
     const [skills, setSkills] = useState(['JavaScript', 'React', 'Node.js']);

     const handleSkillClick = (skill) => {
       alert(`Du klikket på: ${skill}`);
     };

     const handleDeleteSkill = (index) => {
       setSkills(skills.filter((_, i) => i !== index));
     };

     const projects = [
       { title: 'Prosjekt 1', description: 'Beskrivelse av prosjekt 1', link: 'http://example.com' },
       { title: 'Prosjekt 2', description: 'Beskrivelse av prosjekt 2', link: 'http://example.com' },
     ];

     return (
       <div>
         <h1>Min App</h1>
         <Education school="MIT" degree="Bachelor of Science" />
         <Skills skills={skills} onSkillClick={handleSkillClick} onDeleteSkill={handleDeleteSkill} />
         <Projects projects={projects} />
         <Footer year={2024} />
       </div>
     );
   }

   export default App;
   ```

   </details>