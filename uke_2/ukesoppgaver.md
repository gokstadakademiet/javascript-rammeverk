# Oppgavesett: Interaktiv Online CV Webapplikasjon
# Innholdsfortegnelse

1. [Oppgavesett: Interaktiv Online CV Webapplikasjon](#oppgavesett-interaktiv-online-cv-webapplikasjon)
    1. [Introduksjon til `useEffect`](#introduksjon-til-useeffect)
        1. [Oppgave 1: Enkel sideinnlasting](#oppgave-1-enkel-sideinnlasting)
        2. [Oppgave 2: Sporing av visninger](#oppgave-2-sporing-av-visninger)
        3. [Oppgave 3: `StrictMode` og `useEffect`](#oppgave-3-strictmode-og-useeffect)
        4. [Oppgave 4: Overvåkning av endringer](#oppgave-4-overvåkning-av-endringer)
        5. [Oppgave 5: Dynamisk tittel](#oppgave-5-dynamisk-tittel)
        6. [Oppgave 6: API-kall ved lasting](#oppgave-6-api-kall-ved-lasting)
        7. [Oppgave 7: Avhengigheter i `useEffect`](#oppgave-7-avhengigheter-i-useeffect)
        8. [Oppgave 8: Avhengigheter med komplekse objekter](#oppgave-8-avhengigheter-med-komplekse-objekter)
        9. [Oppgave 9: Avhengigheter med flere effekter](#oppgave-9-avhengigheter-med-flere-effekter)
        10. [Oppgave 10: Tidsbasert oppdatering](#oppgave-10-tidsbasert-oppdatering)
        11. [Oppgave 11: Formhåndtering](#oppgave-11-formhåndtering)
        12. [Oppgave 12: Avbryte API-kall](#oppgave-12-avbryte-api-kall)
        13. [Oppgave 13: Debouncing med `useEffect`](#oppgave-13-debouncing-med-useeffect)
        14. [Oppgave 14: Dynamisk bakgrunnsfarge](#oppgave-14-dynamisk-bakgrunnsfarge)
        15. [Oppgave 15: Synkronisere tilstand med URL-parametere](#oppgave-15-synkronisere-tilstand-med-url-parametere)
2. [Feilsøkingsoppgaver](#feilsøkingsoppgaver)
    1. [Feilsøkingsoppgave 1](#feilsøkingsoppgave-1)
    2. [Feilsøkingsoppgave 2](#feilsøkingsoppgave-2)
    3. [Feilsøkingsoppgave 3](#feilsøkingsoppgave-3)
    4. [Feilsøkingsoppgave 4](#feilsøkingsoppgave-4)
    5. [Feilsøkingsoppgave 5](#feilsøkingsoppgave-5)
    6. [Feilsøkingsoppgave 6](#feilsøkingsoppgave-6)

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

**Forklaring:**

1. **Importere `useEffect`**: Først importerer vi `useEffect` fra React. Dette er en hook som lar oss utføre sideeffekter i funksjonelle komponenter.
   
2. **Definere `useEffect`**: Inne i komponenten `CVApp`, bruker vi `useEffect`-hooken. Den tar to argumenter:
   - En funksjon som inneholder koden vi ønsker å kjøre.
   - En avhengighetsarray som bestemmer når effekten skal kjøres. En tom array betyr at effekten bare skal kjøre én gang, når komponenten monteres.

3. **Konsollmelding**: Inne i funksjonen som vi gir til `useEffect`, legger vi til en `console.log`-melding som sier 'CV-appen er lastet!'. Dette vil kjøre én gang når komponenten først lastes.

</details>

> [!NOTE]  
> `useEffect` med tom avhengighetsarray kjører kun én gang ved første render, noe som er nyttig for initialiseringslogikk.

### **Oppgave 2: Sporing av visninger**

Ved hjelp av `useEffect`, opprett en funksjon som holder styr på og viser antall ganger brukeren har besøkt CV-webapplikasjonen. 

Hint: Kombiner `useEffect` med `localStorage`.

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

**Forklaring:**

1. **`localStorage`**: Dette er en nettleser-API som lar oss lagre data i brukerens nettleser. Dataen forblir lagret selv etter at brukeren lukker nettleseren.

2. **Hente antall visninger**: Vi bruker `localStorage.getItem` for å hente antall visninger fra `localStorage`. Hvis det finnes en verdi, øker vi den med 1. Hvis ikke, setter vi den til 1.

3. **Lagre antall visninger**: Vi bruker `localStorage.setItem` for å lagre den oppdaterte verdien tilbake til `localStorage`.

4. **Logge til konsollen**: Til slutt logger vi antall visninger til konsollen.

</details>

### **Oppgave 3: `StrictMode` og `useEffect`**

React's `StrictMode` kan føre til at `useEffect` kjører to ganger i utviklingsmodus, selv om den kun kjører én gang i produksjonsmodus. Dette er for å hjelpe utviklere med å identifisere potensielle problemer.

Lag en komponent som demonstrerer dette ved å logge en melding til konsollen hver gang `useEffect` kjører. Fjern deretter `StrictMode` fra `App.jsx` og observer hvordan denne endringen manifesterer seg i `Inspect -> Console`. 

<details><summary>Se full kode</summary>

```javascript
import React, { useEffect } from 'react';

const StrictModeExample = () => {
  useEffect(() => {
    console.log('useEffect kjører');
  }, []);

  return (
    <div>
      <h1>StrictMode Eksempel</h1>
    </div>
  );
}

export default StrictModeExample;

---

import React from 'react';
import ReactDOM from 'react-dom';
import StrictModeExample from './StrictModeExample';

ReactDOM.render(
  <React.StrictMode>
    <StrictModeExample />
  </React.StrictMode>,
  document.getElementById('root')
);
```



**Forklaring:**

1. **`StrictMode`**: Dette er et verktøy for å fremheve potensielle problemer i en applikasjon. Dette skjer i form av 

2. **`useEffect` i `StrictMode`**: I utviklingsmodus kjører `StrictMode` `useEffect` to ganger for å hjelpe med å identifisere sideeffekter som ikke er rene. Dette skjer ikke i produksjonsmodus.

3. **Demonstrasjon**: Når du kjører komponenten `StrictModeExample` i utviklingsmodus, vil du se meldingen "useEffect kjører" to ganger i konsollen. I produksjonsmodus vil meldingen kun vises én gang.

</details>

</br>

> [!NOTE]  
> `StrictMode` påvirker kun utviklingsmodus og har ingen effekt i produksjonsbygg. Dette hjelper utviklere med å skrive mer robust og feilfri kode. Bruk `StrictMode` for å identifisere og fikse potensielle problemer tidlig i utviklingsprosessen.

### **Oppgave 4: Overvåkning av endringer**

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

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for ferdigheter. `skills` er en array som holder ferdighetene, og `setSkills` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `skills` som avhengighet. Dette betyr at effekten vil kjøre hver gang `skills` endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den oppdaterte listen over ferdigheter til konsollen.

4. **Legge til ferdighet**: Vi definerer en funksjon `addSkill` som tar en ferdighet som argument og legger den til `skills`-arrayen ved hjelp av `setSkills`.

</details>

</br>

> [!TIP]  
> Bruk en unik nøkkel for hver ferdighet i listen for å unngå potensielle problemer med Reacts gjenbruk av elementer.

### **Oppgave 5: Dynamisk tittel**

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

### **Oppgave 6: API-kall ved lasting**

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

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for dataen vi henter fra API-et. `data` holder dataen, og `setData` er funksjonen for å oppdatere denne tilstanden.

2. **Hente data**: Vi bruker `fetch`-funksjonen til å hente data fra API-et. Når vi får en respons, konverterer vi den til JSON og oppdaterer `data`-tilstanden med `setData`.

3. **Håndtere feil**: Vi legger til en `catch`-blokk for å logge eventuelle feil som oppstår under henting av data.

4. **Vise data**: I returblokken viser vi dataen hvis den er tilgjengelig. Hvis ikke, viser vi en lastemelding.

</details>

</br>

> [!TIP]  
> Husk å håndtere feil som kan oppstå under API-kall, slik at brukeren får en god opplevelse selv om noe går galt.

### **Oppgave 7: Avhengigheter i `useEffect`**

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

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for telleren. `count` holder verdien av telleren, og `setCount` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `count` som avhengighet. Dette betyr at effekten vil kjøre hver gang `count` endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den oppdaterte verdien av telleren til konsollen.

4. **Øke teller**: Vi definerer en knapp som, når den klikkes, øker verdien av telleren ved hjelp av `setCount`.

</details>

### **Oppgave 8: Avhengigheter med komplekse objekter**

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

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for oppgavelisten. `tasks` er en array som holder oppgavene, og `setTasks` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `tasks` som avhengighet. Dette betyr at effekten vil kjøre hver gang `tasks` endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den oppdaterte listen over oppgaver til konsollen.

4. **Legge til oppgave**: Vi definerer en funksjon `addTask` som tar en oppgave som argument og legger den til `tasks`-arrayen ved hjelp av `setTasks`.

</details>

</br>

> [!CAUTION]  
> Når du arbeider med komplekse objekter som arrays, sørg for å lage nye kopier av objektene for å unngå uventede sideeffekter.

### **Oppgave 9: Avhengigheter med flere effekter**

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

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette to tilstander: en for telleren (`count`) og en for oppgavelisten (`tasks`).

2. **Overvåke endringer**: Vi bruker to `useEffect`-hooks, en for `count` og en for `tasks`. Dette betyr at vi vil logge til konsollen hver gang enten telleren eller oppgavelisten endres.

3. **Logge til konsollen**: Inne i hver `useEffect`-funksjon logger vi den oppdaterte verdien av telleren og oppgavelisten til konsollen.

4. **Øke teller og legge til oppgave**: Vi definerer en knapp for å øke telleren og en knapp for å legge til en oppgave, ved hjelp av `setCount` og `setTasks`.

</details>

</br>

> [!NOTE]  
> Det er mulig å ha flere `useEffect`-hooks i en komponent for å håndtere forskjellige sideeffekter separat.

### **Oppgave 10: Tidsbasert oppdatering**

Lag en komponent som viser gjeldende tid og oppdaterer den hvert sekund ved hjelp av `useEffect`.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const Clock = () => {
  const [time, setTime] = useState(new Date().toLocaleTimeString());

  useEffect(() => {
    const interval = setInterval(() => {
      setTime(new Date().toLocaleTimeString());
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  return (
    <div>
      <p>Gjeldende tid: {time}</p>
    </div>
  );
}
```

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for tiden. `time` holder den nåværende tiden, og `setTime` er funksjonen for å oppdatere denne tilstanden.

2. **Oppdatere tid**: Vi bruker `setInterval` til å oppdatere tiden hvert sekund. `clearInterval` brukes for å rydde opp når komponenten demonteres.

3. **Vise tid**: I returblokken viser vi den nåværende tiden.

</details>

### **Oppgave 11: Formhåndtering**

Lag en komponent som håndterer et enkelt skjema med `useState` og `useEffect`. Logg skjemaets data til konsollen hver gang det endres.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const SimpleForm = () => {
  const [formData, setFormData] = useState({ name: '', email: '' });

  useEffect(() => {
    console.log('Skjema data:', formData);
  }, [formData]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  return (
    <form>
      <div>
        <label>Navn:</label>
        <input type="text" name="name" value={formData.name} onChange={handleChange} />
      </div>
      <div>
        <label>Email:</label>
        <input type="email" name="email" value={formData.email} onChange={handleChange} />
      </div>
    </form>
  );
}
```

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for skjemaets data. `formData` holder dataen, og `setFormData` er funksjonen for å oppdatere denne tilstanden.

2. **Overvåke endringer**: Vi bruker `useEffect` med `formData` som avhengighet. Dette betyr at effekten vil kjøre hver gang `formData` endres.

3. **Håndtere endringer**: Vi definerer en `handleChange`-funksjon som oppdaterer `formData` når brukeren skriver i skjemaet.

4. **Vise skjema**: I returblokken viser vi skjemaet med inputfelter for navn og email.

</details>

### **Oppgave 12: Avbryte API-kall**

Lag en komponent som henter data fra et API, men avbryter API-kallet hvis komponenten demonteres før kallet fullføres.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const FetchWithAbort = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    const controller = new AbortController();
    const signal = controller.signal;

    fetch('https://api.example.com/data', { signal })
      .then(response => response.json())
      .then(data => setData(data))
      .catch(error => {
        if (error.name !== 'AbortError') {
          console.error('Error fetching data:', error);
        }
      });

    return () => controller.abort();
  }, []);

  return (
    <div>
      {data ? <pre>{JSON.stringify(data, null, 2)}</pre> : 'Laster data...'}
    </div>
  );
}
```

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for dataen vi henter fra API-et. `data` holder dataen, og `setData` er funksjonen for å oppdatere denne tilstanden.

2. **Avbryte API-kall**: Vi bruker `AbortController` til å avbryte API-kallet hvis komponenten demonteres før kallet fullføres.

3. **Håndtere feil**: Vi legger til en `catch`-blokk for å logge eventuelle feil som oppstår under henting av data, bortsett fra `AbortError`.

4. **Vise data**: I returblokken viser vi dataen hvis den er tilgjengelig. Hvis ikke, viser vi en lastemelding.

</details>

</br>

> [!TIP]  
> Bruk `AbortController` for å avbryte API-kall og unngå potensielle minnelekkasjer når komponenter demonteres.

### **Oppgave 13: Debouncing med `useEffect`**

Lag en komponent som viser en søkeboks. Bruk `useEffect` til å implementere debouncing, slik at API-kall kun utføres når brukeren slutter å skrive i et visst tidsrom.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const SearchWithDebounce = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);

  useEffect(() => {
    const handler = setTimeout(() => {
      if (query) {
        fetch(`https://api.example.com/search?q=${query}`)
          .then(response => response.json())
          .then(data => setResults(data))
          .catch(error => console.error('Error fetching data:', error));
      }
    }, 500);

    return () => clearTimeout(handler);
  }, [query]);

  return (
    <div>
      <input
        type="text"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder="Søk..."
      />
      <ul>
        {results.map((result, index) => (
          <li key={index}>{result.name}</li>
        ))}
      </ul>
    </div>
  );
}
```

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette tilstander for søkespørringen (`query`) og søkeresultatene (`results`).

2. **Debouncing**: Vi bruker `setTimeout` til å forsinke API-kallet til brukeren har sluttet å skrive i 500 millisekunder. `clearTimeout` brukes for å rydde opp når komponenten demonteres eller `query` endres.

3. **Hente data**: Vi bruker `fetch` til å hente søkeresultater fra API-et basert på søkespørringen.

4. **Vise resultater**: I returblokken viser vi en inputboks for søkespørringen og en liste over søkeresultatene.

</details>

</br>

> [!TIP]  
> Debouncing kan forbedre ytelsen ved å redusere antall API-kall som utføres mens brukeren skriver.

### **Oppgave 14: Dynamisk bakgrunnsfarge**

Lag en komponent som endrer bakgrunnsfargen på siden basert på en tilstand. Bruk `useEffect` til å oppdatere bakgrunnsfargen.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';

const BackgroundColorChanger = () => {
  const [color, setColor] = useState('#ffffff');

  useEffect(() => {
    document.body.style.backgroundColor = color;
    return () => {
      document.body.style.backgroundColor = '';
    };
  }, [color]);

  return (
    <div>
      <input
        type="color"
        value={color}
        onChange={(e) => setColor(e.target.value)}
      />
    </div>
  );
}
```

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for bakgrunnsfargen (`color`).

2. **Oppdatere bakgrunnsfarge**: Vi bruker `useEffect` til å oppdatere `document.body.style.backgroundColor` basert på `color`-tilstanden. Vi rydder opp ved å tilbakestille bakgrunnsfargen når komponenten demonteres.

3. **Vise fargevelger**: I returblokken viser vi en inputboks for å velge farge.

</details>

</br>

> [!TIP]  
> Bruk `useEffect` til å utføre sideeffekter som påvirker DOM direkte, som å endre bakgrunnsfargen på siden.

### **Oppgave 15: Synkronisere tilstand med URL-parametere**

Lag en komponent som synkroniserer en tilstand med URL-parametere ved hjelp av `useEffect`.

<details><summary>Se full kode</summary>

```javascript
import { useEffect, useState } from 'react';
import { useLocation, useHistory } from 'react-router-dom';

const SyncWithURL = () => {
  const [query, setQuery] = useState('');
  const location = useLocation();
  const history = useHistory();

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const q = params.get('q');
    if (q) {
      setQuery(q);
    }
  }, [location]);

  useEffect(() => {
    const params = new URLSearchParams();
    if (query) {
      params.set('q', query);
    } else {
      params.delete('q');
    }
    history.push({ search: params.toString() });
  }, [query, history]);

  return (
    <div>
      <input
        type="text"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder="Søk..."
      />
    </div>
  );
}
```

**Forklaring:**

1. **`useState`**: Vi bruker `useState`-hooken til å opprette en tilstand for søkespørringen (`query`).

2. **Synkronisere med URL**: Vi bruker `useEffect` til å oppdatere `query`-tilstanden basert på URL-parametere når komponenten monteres eller URL-en endres.

3. **Oppdatere URL**: Vi bruker en annen `useEffect` til å oppdatere URL-parametrene basert på `query`-tilstanden.

4. **Vise input**: I returblokken viser vi en inputboks for søkespørringen.

</details>

</br>

> [!TIP]  
> Synkronisering av tilstand med URL-parametere kan forbedre brukeropplevelsen ved å gjøre det mulig å dele og bokmerke spesifikke tilstander i applikasjonen.


<!-- ### **Oppgave 10: Bruk av `useEffect` med React Router**

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

**Forklaring:**

1. **`useLocation`**: Dette er en hook fra React Router som gir oss tilgang til lokasjonsobjektet, som inneholder informasjon om den nåværende ruten.

2. **Overvåke ruteendringer**: Vi bruker `useEffect` med `location` som avhengighet. Dette betyr at effekten vil kjøre hver gang ruten endres.

3. **Logge til konsollen**: Inne i `useEffect`-funksjonen logger vi den nåværende ruten til konsollen.

4. **Vise gjeldende rute**: I returblokken viser vi den nåværende ruten ved hjelp av `location.pathname`.

</details> -->
## Feilsøkingsoppgaver

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


### **Feilsøkingsoppgave 4**

Finn feilen i koden nedenfor.

Denne komponenten skal vise en teller som øker med 1 hver gang brukeren klikker på knappen. Men det ser ut til at telleren ikke oppdateres riktig.

```javascript
import { useState } from 'react';

const Incrementer = () => {
    const [count, setCount] = useState(0);

    const increment = () => {
        setCount(count + 1);
    };

    return (
        <div>
            <p>Teller: {count}</p>
            <button onClick={increment}>Øk teller</button>
        </div>
    );
}
```

<details><summary>Tips</summary>
Feilen ligger i hvordan `setCount` brukes i `increment`-funksjonen.
</details>

<details><summary>Løsningsforslag</summary>
Bruk funksjonsformen til `setCount` for å sikre at oppdateringen skjer riktig:

```javascript
const increment = () => {
    setCount(prevCount => prevCount + 1);
};
```
</details>

### **Feilsøkingsoppgave 5**

Finn feilen i koden nedenfor.

Denne komponenten skal vise en melding som endres når brukeren skriver i tekstfeltet. Men meldingen oppdateres ikke som forventet.

```javascript
import { useState } from 'react';

const MessageUpdater = () => {
    const [message, setMessage] = useState('Hello');

    const handleChange = (event) => {
        setMessage = event.target.value;
    };

    return (
        <div>
            <input type="text" onChange={handleChange} />
            <p>Melding: {message}</p>
        </div>
    );
}
```

<details><summary>Tips</summary>
Feilen ligger i hvordan `setMessage` brukes i `handleChange`-funksjonen.
</details>

<details><summary>Løsningsforslag</summary>
Bruk `setMessage` som en funksjon i stedet for å tildele en verdi direkte:

```javascript
const handleChange = (event) => {
    setMessage(event.target.value);
};
```
</details>

### **Feilsøkingsoppgave 6**

Finn feilen i koden nedenfor.

Denne komponenten skal vise en liste over brukere som hentes fra et API. Men det ser ut til at listen ikke vises som forventet.

```javascript
import { useEffect, useState } from 'react';

const UserList = () => {
    const [users, setUsers] = useState([]);

    useEffect(() => {
        fetch('https://fake-json-api.mock.beeceptor.com/users')
            .then(response => response.json())
            .then(data => setUsers(data.users))
            .catch(error => console.error('Error fetching users:', error));
    }, []);

    return (
        <div>
            <ul>
                {users.map(user => (
                    <li key={user.id}>{user.name}</li>
                ))}
            </ul>
        </div>
    );
}
```

<details><summary>Tips</summary>
Feilen kan ligge i hvordan dataen fra API-et håndteres.
</details>

<details><summary>Løsningsforslag</summary>
Sjekk strukturen på dataen som returneres fra API-et og sørg for at `data.users` eksisterer:

```javascript
useEffect(() => {
    fetch('https://fake-json-api.mock.beeceptor.com/users')
        .then(response => response.json())
        .then(data => setUsers(data))
        .catch(error => console.error('Error fetching users:', error));
}, []);
```
For å sjekke strukturen på dataen som returneres fra API-et, kan du åpne nettleseren og skrive inn URL-en [https://fake-json-api.mock.beeceptor.com/users](https://fake-json-api.mock.beeceptor.com/users). Dette vil vise deg JSON-responsen fra API-et, og du kan se hvordan dataen er strukturert. Sørg for at endepunktet eksisterer og inneholder en liste over brukere.
</details>
