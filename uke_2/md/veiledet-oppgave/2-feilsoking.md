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

For å sjekke strukturen på dataen som returneres fra API-et, kan du åpne nettleseren og skrive inn URL-en `https://fake-json-api.mock.beeceptor.com/users`. Dette vil vise deg JSON-responsen fra API-et, og du kan se hvordan dataen er strukturert. Sørg for at endepunktet eksisterer og inneholder en liste over brukere.
</details>
