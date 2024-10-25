## Utfordringsoppgaver

### **Oppgave 1: Tidsbasert oppdatering**

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

### **Oppgave 2: Formhåndtering**

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

### **Oppgave 3: Avbryte API-kall**

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

### **Oppgave 4: Debouncing med `useEffect`**

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

### **Oppgave 5: Dynamisk bakgrunnsfarge**

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

### **Oppgave 6: Synkronisere tilstand med URL-parametere**

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
