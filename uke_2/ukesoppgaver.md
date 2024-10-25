# Oppgavesett: Interaktiv Online CV Webapplikasjon

## Introduksjon til `useEffect`

### **Oppgave 1: Enkel sideinnlasting**

Når CV-webapplikasjonen lastes, vis en melding i konsollen som sier 'CV-appen er lastet!'. Hint: Bruk `useEffect` uten avhengighetsarray for å utføre effekten ved første render.

<details><summary>Se full kode</summary>

```javascript
import { useEffect } from 'react';

const CVApp = () => {
  useEffect(() => {
    console.log('CV-appen er lastet!');
  }, []);

  return (
    // Resten av din app-kode
    <div>
      <h1>Din CV App</h1>
    </div>
  );
}
```

</details>

**Forklaring:**

1. **Importere `useEffect`**: Først importerer vi `useEffect` fra React. Dette er en hook som lar oss utføre sideeffekter i funksjonelle komponenter.
   
2. **Definere `useEffect`**: Inne i komponenten `CVApp`, bruker vi `useEffect`-hooken. Den tar to argumenter:
   - En funksjon som inneholder koden vi ønsker å kjøre.
   - En avhengighetsarray som bestemmer når effekten skal kjøres. En tom array betyr at effekten bare skal kjøre én gang, når komponenten monteres.

3. **Konsollmelding**: Inne i funksjonen som vi gir til `useEffect`, legger vi til en `console.log`-melding som sier 'CV-appen er lastet!'. Dette vil kjøre én gang når komponenten først lastes.

> [!NOTE]  
> `useEffect` uten avhengighetsarray kjører kun én gang ved første render, noe som er nyttig for initialiseringslogikk.

### **Oppgave 2: Sporing av visninger**

Ved hjelp av `useEffect`, opprett en funksjon som holder styr på og viser antall ganger brukeren har besøkt CV-webapplikasjonen. Hint: Kombiner `useEffect` med `localStorage`.


<details><summary>Se full kode</summary>

```javascript
useEffect(() => {
  let count = localStorage.getItem('viewCount');
  if (count) {
    count = Number(count) + 1;
  } else {
    count = 1;
  }
  localStorage.setItem('viewCount', count);
  console.log(`Du har besøkt denne CV-appen ${count} ganger.`);
}, []);
```

</details>

**Forklaring:**

1. **`localStorage`**: Dette er en nettleser-API som lar oss lagre data i brukerens nettleser. Dataen forblir lagret selv etter at brukeren lukker nettleseren.

2. **Hente antall visninger**: Vi bruker `localStorage.getItem` for å hente antall visninger fra `localStorage`. Hvis det finnes en verdi, øker vi den med 1. Hvis ikke, setter vi den til 1.

3. **Lagre antall visninger**: Vi bruker `localStorage.setItem` for å lagre den oppdaterte verdien tilbake til `localStorage`.

4. **Logge til konsollen**: Til slutt logger vi antall visninger til konsollen.

### **Oppgave 3: Overvåkning av endringer**

La oss si at det er en seksjon hvor brukerne kan legge til ferdighetene de har. Overvåk denne seksjonen for endringer, og hver gang en ny ferdighet blir lagt til, logg det til konsollen.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const SkillsSection = () => {
  const [skills, setSkills] = useState([]);

  useEffect(() => {
    console.log('Ferdigheter oppdatert:', skills);
  }, [skills]);

  const addSkill = (skill) => {
    setSkills([...skills, skill]);
  };

  return (
    <div>
      <ul>
        {skills.map((skill, index) => (
          <li key={index}>{skill}</li>
        ))}
      </ul>
      <button onClick={() => addSkill('Ny ferdighet')}>Legg til ferdighet</button>
    </div>
  );
}
```
</details>

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for ferdigheter. `skills` er en array som holder ferdighetene, og `setSkills` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `skills` som avhengighet. Dette betyr at effekten vil kjøre hver gang `skills` endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den oppdaterte listen over ferdigheter til konsollen.

4. **Legge til ferdighet**: Vi definerer en funksjon `addSkill` som tar en ferdighet som argument og legger den til `skills`-arrayen ved hjelp av `setSkills`.

> [!TIP]  
> Bruk en unik nøkkel for hver ferdighet i listen for å unngå potensielle problemer med Reacts gjenbruk av elementer.

### **Oppgave 4: Dynamisk tittel**

Bruk `useEffect` til å oppdatere dokumenttittelen til å inkludere antall visninger fra forrige oppgave.


```diff
  ...
  count = 1;
     }
     localStorage.setItem('viewCount', count);
-    console.log(`Du har besøkt denne CV-appen ${count} ganger.`);
+    document.title = `CV-appen (${count} visninger)`;
   }, []);
   ...
```

<details><summary>Se full kode</summary>

```javascript
useEffect(() => {
  let count = localStorage.getItem('viewCount');
  if (count) {
    count = Number(count) + 1;
  } else {
    count = 1;
  }
  localStorage.setItem('viewCount', count);
  document.title = `CV-appen (${count} visninger)`;
}, []);
```
</details>

**Forklaring:**

1. **Hente antall visninger**: Vi bruker `localStorage.getItem` for å hente antall visninger fra `localStorage`, akkurat som i oppgave 2.

2. **Oppdatere dokumenttittel**: Vi bruker `document.title` for å sette tittelen på nettsiden til å inkludere antall visninger.

3. **Kjøre effekten én gang**: Ved å gi `useEffect` en tom avhengighetsarray, sørger vi for at denne effekten bare kjører én gang når komponenten monteres.

> [!NOTE]  
> Oppdatering av dokumenttittelen kan forbedre brukeropplevelsen ved å gi kontekstuell informasjon direkte i nettleserfanen.

### **Oppgave 5: API-kall ved lasting**

Bruk `useEffect` til å hente data fra et API når komponenten lastes. Vis dataene i komponenten.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const CVApp = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch('https://api.example.com/data')
      .then(response => response.json())
      .then(data => setData(data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  return (
    <div>
      {data ? <pre>{JSON.stringify(data, null, 2)}</pre> : 'Laster data...'}
    </div>
  );
}
```
</details>

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for dataen vi henter fra API-et. `data` holder dataen, og `setData` er funksjonen for å oppdatere denne tilstanden.

2. **Hente data**: Vi bruker `fetch`-funksjonen til å hente data fra API-et. Når vi får en respons, konverterer vi den til JSON og oppdaterer `data`-tilstanden med `setData`.

3. **Håndtere feil**: Vi legger til en `catch`-blokk for å logge eventuelle feil som oppstår under henting av data.

4. **Vise data**: I returblokken viser vi dataen hvis den er tilgjengelig. Hvis ikke, viser vi en lastemelding.

> [!WARNING]  
> Husk å håndtere feil som kan oppstå under API-kall, slik at brukeren får en god opplevelse selv om noe går galt.

### **Oppgave 6: Avhengigheter i `useEffect`**

Lag en komponent som viser en teller. Bruk `useEffect` til å logge verdien av telleren hver gang den endres.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log(`Teller: ${count}`);
  }, [count]);

  return (
    <div>
      <p>Teller: {count}</p>
      <button onClick={() => setCount(count + 1)}>Øk teller</button>
    </div>
  );
}
```
</details>

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for telleren. `count` holder verdien av telleren, og `setCount` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `count` som avhengighet. Dette betyr at effekten vil kjøre hver gang `count` endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den oppdaterte verdien av telleren til konsollen.

4. **Øke teller**: Vi definerer en knapp som, når den klikkes, øker verdien av telleren ved hjelp av `setCount`.

### **Oppgave 7: Avhengigheter med komplekse objekter**

Lag en komponent som viser en liste over oppgaver. Bruk `useEffect` til å logge listen hver gang den endres.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const TaskList = () => {
  const [tasks, setTasks] = useState([]);

  useEffect(() => {
    console.log('Oppgaveliste:', tasks);
  }, [tasks]);

  const addTask = (task) => {
    setTasks([...tasks, task]);
  };

  return (
    <div>
      <ul>
        {tasks.map((task, index) => (
          <li key={index}>{task}</li>
        ))}
      </ul>
      <button onClick={() => addTask(`Oppgave ${tasks.length + 1}`)}>Legg til oppgave</button>
    </div>
  );
}
```
</details>

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for oppgavelisten. `tasks` er en array som holder oppgavene, og `setTasks` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `tasks` som avhengighet. Dette betyr at effekten vil kjøre hver gang `tasks` endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den oppdaterte listen over oppgaver til konsollen.

4. **Legge til oppgave**: Vi definerer en funksjon `addTask` som tar en oppgave som argument og legger den til `tasks`-arrayen ved hjelp av `setTasks`.

> [!CAUTION]  
> Når du arbeider med komplekse objekter som arrays, sørg for å lage nye kopier av objektene for å unngå uventede sideeffekter.

### **Oppgave 8: Avhengigheter med flere effekter**

Lag en komponent som viser en teller og en liste over oppgaver. Bruk `useEffect` til å logge telleren og listen hver gang de endres.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const CounterAndTaskList = () => {
  const [count, setCount] = useState(0);
  const [tasks, setTasks] = useState([]);

  useEffect(() => {
    console.log(`Teller: ${count}`);
  }, [count]);

  useEffect(() => {
    console.log('Oppgaveliste:', tasks);
  }, [tasks]);

  const addTask = (task) => {
    setTasks([...tasks, task]);
  };

  return (
    <div>
      <p>Teller: {count}</p>
      <button onClick={() => setCount(count + 1)}>Øk teller</button>
      <ul>
        {tasks.map((task, index) => (
          <li key={index}>{task}</li>
        ))}
      </ul>
      <button onClick={() => addTask(`Oppgave ${tasks.length + 1}`)}>Legg til oppgave</button>
    </div>
  );
}
```
</details>

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette to tilstander: en for telleren (`count`) og en for oppgavelisten (`tasks`).

2. **Overvåke endringer**: Vi bruker to `useEffect`-hooks, en for `count` og en for `tasks`. Dette betyr at vi vil logge til konsollen hver gang enten telleren eller oppgavelisten endres.

3. **Logge til konsollen**: Inne i hver `useEffect`-funksjon logger vi den oppdaterte verdien av telleren og oppgavelisten til konsollen.

4. **Øke teller og legge til oppgave**: Vi definerer en knapp for å øke telleren og en knapp for å legge til en oppgave, ved hjelp av `setCount` og `setTasks`.

> [!NOTE]  
> Det er mulig å ha flere `useEffect`-hooks i en komponent for å håndtere forskjellige sideeffekter separat.

### **Oppgave 9: Bruk av `useEffect` med React Router**

Lag en komponent som bruker React Router for å navigere mellom sider. Bruk `useEffect` til å utføre sideeffekter basert på ruten.

<details><summary>Se full kode</summary>

```javascript
import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

const RouterComponent = () => {
  const location = useLocation();

  useEffect(() => {
    console.log(`Navigert til: ${location.pathname}`);
  }, [location]);

  return (
    <div>
      <h2>Gjeldende rute: {location.pathname}</h2>
    </div>
  );
}
```
</details>

**Forklaring:**

1. **`useLocation`**: Dette er en hook fra React Router som gir oss tilgang til lokasjonsobjektet, som inneholder informasjon om den nåværende ruten.

2. **Overvåke ruteendringer**: Vi bruker `useEffect` med `location` som avhengighet. Dette betyr at effekten vil kjøre hver gang ruten endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den nåværende ruten til konsollen.

4. **Vise gjeldende rute**: I returblokken viser vi den nåværende ruten ved hjelp av `location.pathname`.


### **Feilsøkingsoppgave 1:**

Finn feilen i koden nedenfor. 

Koden skal logge verdien av telleren til konsollen hver gang den endres. Kjør koden uten å gjøre noen endringer først, og observer hva som skjer i `Inspect -> Console` i nettleseren.

```jsx
import { useEffect, useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log(`Teller: ${count}`);
  }, []);

  return (
    <div>
      <p>Teller: {count}</p>
      <button onClick={() => setCount(count + 1)}>Øk teller</button>
    </div>
  );
}
```

<details><summary>Tips</summary>
Feilen ligger i avhengighetsarrayen til `useEffect`.
</details>

<details><summary>Løsningsforslag</summary>
Avhengighetsarrayen til `useEffect` bør inkludere `count` for å logge verdien hver gang den endres:

```javascript
useEffect(() => {
  console.log(`Teller: ${count}`);
}, [count]);
```
</details>

### **Feilsøkingsoppgave 2**

Finn feilen i koden nedenfor. 

Denne komponenten skal vise en liste over oppgaver og oppdatere listen hver gang en ny oppgave legges til. Når brukeren klikker på knappen, skal en ny oppgave legges til `tasks`-arrayen, og komponenten skal re-rendres for å vise den oppdaterte listen.

```javascript
import { useEffect, useState } from 'react';

const TaskList = () => {
  const [tasks, setTasks] = useState([]);

  useEffect(() => {
    console.log('Oppgaveliste:', tasks);
  }, [tasks]);

  const addTask = (task) => {
    tasks.push(task);
    setTasks(tasks);
  };

  return (
    <div>
      <ul>
        {tasks.map((task, index) => (
          <li key={index}>{task}</li>
        ))}
      </ul>
      <button onClick={() => addTask(`Oppgave ${tasks.length + 1}`)}>Legg til oppgave</button>
    </div>
  );
}
```

<details><summary>Tips</summary>
Feilen ligger i hvordan `tasks`-arrayen oppdateres.
</details>

<details><summary>Løsningsforslag</summary>
Bruk `setTasks` med en ny kopi av `tasks`-arrayen for å unngå mutasjoner:
```javascript
const addTask = (task) => {
  setTasks([...tasks, task]);
};
```
</details>

### **Feilsøkingsoppgave 3**

Finn feilen i koden nedenfor. Hint: Se nøye på hvordan initialiseringen gjøres.

Denne oppgaven handler om å hente data fra et API når komponenten lastes, og vise dataene i komponenten. Koden bruker `useEffect`-hooken til å utføre et API-kall når komponenten monteres, og lagrer den hentede dataen i en tilstand ved hjelp av `useState`. Hvis dataen er tilgjengelig, vises den i komponenten; ellers vises en lastemelding.

```javascript
import { useEffect, useState } from 'react';

const CVApp = () => {
  const [data, setData] = useState();

  useEffect(() => {
    fetch('https://api.example.com/data')
      .then(response => response.json())
      .then(data => setData(data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  return (
    <div>
      {data ? <pre>{JSON.stringify(data, null, 2)}</pre> : 'Laster data...'}
    </div>
  );
}
```

<details><summary>Tips</summary>
Feilen ligger i initialiseringen av `data`-tilstanden.
</details>

<details><summary>Løsningsforslag</summary>
Initialiser `data`-tilstanden med `null` for å unngå feil ved første render:
```javascript
const [data, setData] = useState(null);
```
</details>



