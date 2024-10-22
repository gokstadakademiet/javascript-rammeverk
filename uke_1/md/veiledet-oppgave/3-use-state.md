## Innføring i React `Hooks: useState`

### Oppgave 1: Vis CV-informasjon

I denne oppgaven skal du lage en seksjon i din CV-webapplikasjon hvor brukeren kan fylle inn sin grunnleggende informasjon: `Navn`, `Alder`, og `Yrke`. Vi bruker React sin `useState`-hook for å lagre og vise denne informasjonen. `useState` lar oss opprette tilstandsvariabler som kan endres og oppdateres når brukeren skriver inn data. Dette er viktig for å kunne håndtere dynamisk innhold i applikasjonen.

> [!IMPORTANT]  
> Sørg for at du forstår hvordan `useState` fungerer, da det er en grunnleggende del av React for å håndtere tilstand.

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

I denne oppgaven skal du lage en funksjon som lar brukeren legge til en liste over ferdigheter. Brukeren skal kunne skrive en ny ferdighet i et tekstfelt og legge den til i en liste ved å trykke en knapp. Vi bruker `useState` for å håndtere denne listen. Dette er nyttig for å kunne legge til og vise flere elementer dynamisk i applikasjonen.

> [!TIP]
> Husk å tømme tekstfeltet etter at en ferdighet er lagt til, slik at brukeren kan legge til flere ferdigheter uten å måtte slette tidligere tekst.

```diff
   const [alder, setAlder] = useState('');
   const [yrke, setYrke] = useState('');
 
+  const [ferdighet, setFerdighet] = useState('');
+  const [ferdigheter, setFerdigheter] = useState([]);
+
+  const leggTilFerdighet = () => {
+    setFerdigheter([...ferdigheter, ferdighet]);
+    setFerdighet('');
+ };
+
   return (
      <div>
-        <h1>Mitt Online CV</h1>
+        <h1>Min Online CV</h1>
         <input 
           type="text" 
           placeholder="Navn" 
@@ -29,6 +37,21 @@ function App() {
         <p>Navn: {navn}</p>
         <p>Alder: {alder}</p>
         <p>Yrke: {yrke}</p>
+
+        <h2>Ferdigheter</h2>
+
+        <input 
+          type="text" 
+          placeholder="Ny ferdighet" 
+          value={ferdighet} 
+          onChange={(e) => setFerdighet(e.target.value)} 
+        />
+        <button onClick={leggTilFerdighet}>Legg til ferdighet</button>
+        <ul>
+          {ferdigheter.map((ferdighet, index) => (
+             <li key={index}>{ferdighet}</li>
+          ))}
+        </ul>
      </div>
```

<details><summary>Se full kode</summary>

```jsx
import React, { useState } from 'react';

function App() {
  const [navn, setNavn] = useState('');
  const [alder, setAlder] = useState('');
  const [yrke, setYrke] = useState('');

  const [ferdighet, setFerdighet] = useState('');
  const [ferdigheter, setFerdigheter] = useState([]);

  const leggTilFerdighet = () => {
    setFerdigheter([...ferdigheter, ferdighet]);
    setFerdighet('');
 };

  return (
     <div>
        <h1>Min Online CV</h1>
        <input 
          type="text" 
          placeholder="Navn" 
          value={navn} 
          onChange={(e) => setNavn(e.target.value)} 
        />
        <input 
          type="text" 
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

        <h2>Ferdigheter</h2>

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

</details>

### Oppgave 3: Custom Hook for CV Data

I denne oppgaven skal du implementere en egendefinert hook kalt `useCVData` for å sentralisere og administrere CV-data ved hjelp av `useState`-hooken. En egendefinert hook er en funksjon som bruker React hooks og lar deg gjenbruke logikk på tvers av komponenter. `useCVData` skal inkludere funksjoner for å legge til ferdigheter og oppdatere grunnleggende informasjon, noe som gjør koden mer modulær og gjenbrukbar. Plasser denne hooken i en mappe kalt `/hooks` og navngi filen `useCVData.jsx`.

> [!NOTE]  
> Custom hooks er en kraftig måte å gjenbruke logikk på tvers av komponenter. Sørg for å forstå hvordan de fungerer og hvordan de kan forbedre koden din.


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

### Oppgave 4: Bruke `useCVData` i `App.jsx`

I denne oppgaven skal du bruke den egendefinerte hooken `useCVData` i `App.jsx` for å erstatte de gamle feltene for navn, alder, yrke osv. Følg stegene nedenfor for å implementere dette:

1. Importer `useCVData` i `App.jsx`.
2. Bruk hooken til å håndtere CV-data.
3. Oppdater feltene for navn, alder, yrke osv. til å bruke hooken.

```diff
import React, { useState } from 'react';
+import useCVData from './hooks/useCVData';
 
 function App() {
-  const [navn, setNavn] = useState('');
-  const [alder, setAlder] = useState('');
-  const [yrke, setYrke] = useState('');
-
   const [ferdighet, setFerdighet] = useState('');
-  const [ferdigheter, setFerdigheter] = useState([]);
+  const { cvData, oppdaterInfo, leggtilFerdighet } = useCVData();
 
-  const leggTilFerdighet = () => {
-    setFerdigheter([...ferdigheter, ferdighet]);
+  const onButtonClick = () => {
+    leggtilFerdighet(ferdighet);
     setFerdighet('');
  };
 
@@ -19,24 +16,24 @@ function App() {
         <input 
           type="text" 
           placeholder="Navn" 
-          value={navn} 
-          onChange={(e) => setNavn(e.target.value)} 
+          value={cvData.navn} 
+          onChange={(e) => oppdaterInfo('navn', e.target.value)} 
         />
         <input 
           type="text" 
           placeholder="Alder" 
-          value={alder} 
-          onChange={(e) => setAlder(e.target.value)} 
+          value={cvData.alder} 
+          onChange={(e) => oppdaterInfo('alder', e.target.value)} 
         />
         <input 
           type="text" 
           placeholder="Yrke" 
-          value={yrke} 
-          onChange={(e) => setYrke(e.target.value)} 
+          value={cvData.yrke} 
+          onChange={(e) => oppdaterInfo('yrke', e.target.value)} 
         />
-        <p>Navn: {navn}</p>
-        <p>Alder: {alder}</p>
-        <p>Yrke: {yrke}</p>
+        <p>Navn: {cvData.navn}</p>
+        <p>Alder: {cvData.alder}</p>
+        <p>Yrke: {cvData.yrke}</p>
 
         <h2>Ferdigheter</h2>
 
@@ -46,9 +43,9 @@ function App() {
           value={ferdighet} 
           onChange={(e) => setFerdighet(e.target.value)} 
         />
-        <button onClick={leggTilFerdighet}>Legg til ferdighet</button>
+        <button onClick={onButtonClick}>Legg til ferdighet</button>
         <ul>
-          {ferdigheter.map((ferdighet, index) => (
+          {cvData.ferdigheter.map((ferdighet, index) => (
              <li key={index}>{ferdighet}</li>
           ))}
         </ul>
```

<details><summary>Se full kode</summary>

```jsx
import React, { useState } from 'react';
import useCVData from './hooks/useCVData';

function App() {
  const [ferdighet, setFerdighet] = useState('');
  const { cvData, oppdaterInfo, leggtilFerdighet } = useCVData();

  const onButtonClick = () => {
    leggtilFerdighet(ferdighet);
    setFerdighet('');
 };

  return (
     <div>
        <h1>Min Online CV</h1>
        <input 
          type="text" 
          placeholder="Navn" 
          value={cvData.navn} 
          onChange={(e) => oppdaterInfo('navn', e.target.value)} 
        />
        <input 
          type="text" 
          placeholder="Alder" 
          value={cvData.alder} 
          onChange={(e) => oppdaterInfo('alder', e.target.value)} 
        />
        <input 
          type="text" 
          placeholder="Yrke" 
          value={cvData.yrke} 
          onChange={(e) => oppdaterInfo('yrke', e.target.value)} 
        />
        <p>Navn: {cvData.navn}</p>
        <p>Alder: {cvData.alder}</p>
        <p>Yrke: {cvData.yrke}</p>

        <h2>Ferdigheter</h2>

        <input 
          type="text" 
          placeholder="Ny ferdighet" 
          value={ferdighet} 
          onChange={(e) => setFerdighet(e.target.value)} 
        />
        <button onClick={onButtonClick}>Legg til ferdighet</button>
        <ul>
          {cvData.ferdigheter.map((ferdighet, index) => (
             <li key={index}>{ferdighet}</li>
          ))}
        </ul>
     </div>
  );
}
export default App;
```

</details>

### Ekstra utfordringsoppgaver

### Oppgave 4: Språk Velger

I denne oppgaven skal du lage en funksjon som lar brukeren velge mellom forskjellige språk for CV-en. Når et språk er valgt, skal all tekst i CVen oppdateres til det valgte språket. Dette kan gjøres ved å ha forskjellige tekststrenger lagret i en tilstand basert på valgt språk. Dette er nyttig for å lage flerspråklige applikasjoner som kan tilpasses brukere fra forskjellige språkområder.

> [!WARNING]  
> Sørg for at alle tekststrenger er korrekt oversatt og at ingen tekst er hardkodet, slik at applikasjonen enkelt kan utvides til å støtte flere språk.

```diff
 
+const tekster = {
+  norsk: {
+     tittel: 'Mitt Online CV',
+     navn: 'Navn',
+     alder: 'Alder',
+     yrke: 'Yrke',
+     ferdigheter: 'Ferdigheter',
+     leggTilFerdighet: 'Legg til ferdighet',
+     nyFerdighet: 'Ny ferdighet'
+  },
+  engelsk: {
+     tittel: 'My Online CV',
+     navn: 'Name',
+     alder: 'Age',
+     yrke: 'Occupation',
+     ferdigheter: 'Skills',
+     leggTilFerdighet: 'Add skill',
+     nyFerdighet: 'New skill'
+  }
+};
+
 function App() {
+  const [sprak, setSprak] = useState('norsk');
   const [ferdighet, setFerdighet] = useState('');
   const { cvData, oppdaterInfo, leggtilFerdighet } = useCVData();
 
@@ -10,40 +32,46 @@ function App() {
     setFerdighet('');
  };
 
+ const tekst = tekster[sprak];
+
   return (
      <div>
-        <h1>Min Online CV</h1>
+        <select onChange={(e) => setSprak(e.target.value)} value={sprak}>
+          <option value="norsk">Norsk</option>
+          <option value="engelsk">Engelsk</option>
+        </select>
+        <h1>{tekst.tittel}</h1>
         <input 
           type="text" 
-          placeholder="Navn" 
+          placeholder={tekst.navn} 
           value={cvData.navn} 
           onChange={(e) => oppdaterInfo('navn', e.target.value)} 
         />
         <input 
           type="text" 
-          placeholder="Alder" 
+          placeholder={tekst.alder}
           value={cvData.alder} 
           onChange={(e) => oppdaterInfo('alder', e.target.value)} 
         />
         <input 
           type="text" 
-          placeholder="Yrke" 
+          placeholder={tekst.yrke}
           value={cvData.yrke} 
           onChange={(e) => oppdaterInfo('yrke', e.target.value)} 
         />
-        <p>Navn: {cvData.navn}</p>
-        <p>Alder: {cvData.alder}</p>
-        <p>Yrke: {cvData.yrke}</p>
+        <p>{tekst.navn}: {cvData.navn}</p>
+        <p>{tekst.alder}: {cvData.alder}</p>
+        <p>{tekst.yrke}: {cvData.yrke}</p>
 
-        <h2>Ferdigheter</h2>
+        <h2>{tekst.ferdigheter}</h2>
 
         <input 
           type="text" 
-          placeholder="Ny ferdighet" 
+          placeholder={tekst.nyFerdighet} 
           value={ferdighet} 
           onChange={(e) => setFerdighet(e.target.value)} 
         />
-        <button onClick={onButtonClick}>Legg til ferdighet</button>
+        <button onClick={onButtonClick}>{tekst.leggTilFerdighet}</button>
         <ul>
           {cvData.ferdigheter.map((ferdighet, index) => (
              <li key={index}>{ferdighet}</li>
```

<details><summary>Se full kode</summary>

```jsx
import React, { useState } from 'react';
import useCVData from './hooks/useCVData';

const tekster = {
  norsk: {
     tittel: 'Mitt Online CV',
     navn: 'Navn',
     alder: 'Alder',
     yrke: 'Yrke',
     ferdigheter: 'Ferdigheter',
     leggTilFerdighet: 'Legg til ferdighet',
     nyFerdighet: 'Ny ferdighet'
  },
  engelsk: {
     tittel: 'My Online CV',
     navn: 'Name',
     alder: 'Age',
     yrke: 'Occupation',
     ferdigheter: 'Skills',
     leggTilFerdighet: 'Add skill',
     nyFerdighet: 'New skill'
  }
};

function App() {
  const [sprak, setSprak] = useState('norsk');
  const [ferdighet, setFerdighet] = useState('');
  const { cvData, oppdaterInfo, leggtilFerdighet } = useCVData();

  const onButtonClick = () => {
    leggtilFerdighet(ferdighet);
    setFerdighet('');
 };

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
          value={cvData.navn} 
          onChange={(e) => oppdaterInfo('navn', e.target.value)} 
        />
        <input 
          type="text" 
          placeholder={tekst.alder}
          value={cvData.alder} 
          onChange={(e) => oppdaterInfo('alder', e.target.value)} 
        />
        <input 
          type="text" 
          placeholder={tekst.yrke}
          value={cvData.yrke} 
          onChange={(e) => oppdaterInfo('yrke', e.target.value)} 
        />
        <p>{tekst.navn}: {cvData.navn}</p>
        <p>{tekst.alder}: {cvData.alder}</p>
        <p>{tekst.yrke}: {cvData.yrke}</p>

        <h2>{tekst.ferdigheter}</h2>

        <input 
          type="text" 
          placeholder={tekst.nyFerdighet} 
          value={ferdighet} 
          onChange={(e) => setFerdighet(e.target.value)} 
        />
        <button onClick={onButtonClick}>{tekst.leggTilFerdighet}</button>
        <ul>
          {cvData.ferdigheter.map((ferdighet, index) => (
             <li key={index}>{ferdighet}</li>
          ))}
        </ul>
     </div>
  );
}
export default App;
```

</details>
