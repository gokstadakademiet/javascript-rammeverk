# Oppgavesett: Interaktiv Online CV Webapplikasjon: `Redux Toolkit`
# Innholdsfortegnelse 


## Oppgavesett: Interaktiv Online CV Webapplikasjon: `Redux Toolkit`

### **Introduksjon:**

Redux Toolkit er den offisielle verktøykassen for Redux. Den lar deg skrive Redux-logikk med færre kodelinjer, og det blir enklere å forholde seg til. I disse oppgavene vil vi videreutvikle vår 'Interaktiv Online CV Webapplikasjon' ved å inkorporere Redux Toolkit.

### **Oppgave 1: Installer Redux Toolkit**

**Instrukser:**

1. Åpne ditt eksisterende prosjekt i terminalen.
2. Installer Redux Toolkit ved å kjøre kommandoen: 

```bash
npm install @reduxjs/toolkit react-redux
```

Redux Toolkit er et bibliotek som hjelper deg med å håndtere tilstanden i din applikasjon på en enklere og mer strukturert måte. `react-redux` er et bindingsbibliotek som lar deg bruke Redux sammen med React.

### **Oppgave 2: Sett opp Redux Store med `configureStore`**

**Instrukser:**

1. I `store.js`, bruk `configureStore` fra Redux Toolkit for å opprette en Redux store.
2. Definer en `rootReducer` som kombinerer alle dine reducere (du kan bruke `combineReducers` fra `redux` hvis nødvendig).

<details><summary>Løsning</summary>

**Eksempel:**

```javascript
import { configureStore } from '@reduxjs/toolkit';
// Importer dine reducere her...

const store = configureStore({
  reducer: {
    // Dine reducer oppføringer her...
  }
});

export default store;
```

**Begrunnelse:**

En Redux store er en sentral del av Redux-arkitekturen. Den holder hele tilstanden til applikasjonen din. `configureStore` er en funksjon fra Redux Toolkit som gjør det enklere å sette opp en store med fornuftige standardinnstillinger.

</details>

### **Oppgave 3: Lag en Slice for Erfaringer**

**Instrukser:**

1. Bruk `createSlice` fra Redux Toolkit for å lage en slice for `experiences`.
2. Definer tilstanden, reducerne, og handlingene i samme fil.
3. Eksporter de nødvendige handlingene og reducere.

<details><summary>Løsning</summary>

```javascript
import { createSlice } from '@reduxjs/toolkit';

const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {
    addExperience: (state, action) => {
      state.push(action.payload);
    },
    removeExperience: (state, action) => {
      return state.filter(exp => exp.id !== action.payload.id);
    }
  }
});

export const { addExperience, removeExperience } = experiencesSlice.actions;

export default experiencesSlice.reducer;
```


**Begrunnelse:**

En slice i Redux Toolkit er en samling av Redux-logikk for en bestemt del av tilstanden. `createSlice` er en funksjon som lar deg definere initial tilstand, reducer-funksjoner, og action creators på en enkel måte. Dette gjør koden din mer lesbar og vedlikeholdbar.

</details>

### **Oppgave 4: Bruk `useDispatch` og `useSelector` fra Redux Toolkit**

**Kodeeksempel:**

```javascript
import React, { useState } from 'react';

const ExperienceList = () => {
  const [experiences, setExperiences] = useState([]);

  const handleAdd = (experience) => {
    setExperiences([...experiences, experience]);
  }

  const handleRemove = (id) => {
    setExperiences(experiences.filter(exp => exp.id !== id));
  }

  // Render logikk for listen her...
}
```

**Instrukser:**

1. Oppdater `ExperienceList` komponenten for å bruke `useDispatch` og `useSelector` fra `react-redux`.
2. Erstatt alle `mapStateToProps` og `mapDispatchToProps` logikken med de nevnte hooks.

<details><summary>Løsning</summary>

```javascript
import { useDispatch, useSelector } from 'react-redux';
import { addExperience, removeExperience } from './path-to-experiencesSlice';

const ExperienceList = () => {
  const experiences = useSelector((state) => state.experiences);
  const dispatch = useDispatch();

  const handleAdd = (experience) => {
    dispatch(addExperience(experience));
  }

  const handleRemove = (id) => {
    dispatch(removeExperience({ id }));
  }

  // Render logikk for listen her...
}
```

**Begrunnelse:**

`useSelector` er en hook som lar deg hente tilstanden fra Redux store i en funksjonell komponent. `useDispatch` er en hook som lar deg sende handlinger til Redux store. Disse het tidligere `mapStateToProps` og `mapDispatchToProps`, men er erstattet av de nye hookene gjør koden din mer konsis og enklere å lese.

</details>

### **Oppgave 5: Feilsøking i Redux Toolkit**

**Introduksjon:**

I denne oppgaven skal du feilsøke en kode som inneholder en feil. Koden nedenfor er ment å legge til og fjerne prosjekter fra en liste. Din oppgave er å finne og rette feilen.

**Instrukser:**

1. Les gjennom koden nedenfor.
2. Identifiser feilen som forhindrer koden fra å fungere som forventet.
3. Rett feilen og forklar hva som var galt.

**Kodeeksempel:**

```javascript
import { createSlice } from '@reduxjs/toolkit';

const projectsSlice = createSlice({
  name: 'projects',
  initialState: [],
  reducers: {
    addProject: (state, action) => {
      state.push(action.payload);
    },
    removeProject: (state, action) => {
      return state.filter(proj => proj.id === action.payload.id);
    }
  }
});

export const { addProject, removeProject } = projectsSlice.actions;

export default projectsSlice.reducer;
```

<details><summary>Løsning</summary>

**Feil:**

Feilen i koden er i `removeProject`-reduceren. Den nåværende implementeringen filtrerer ut elementer som har samme `id` som `action.payload.id`, men den burde filtrere ut elementer som har en annen `id` enn `action.payload.id`.

**Rettet kode:**

```javascript
import { createSlice } from '@reduxjs/toolkit';

const projectsSlice = createSlice({
  name: 'projects',
  initialState: [],
  reducers: {
    addProject: (state, action) => {
      state.push(action.payload);
    },
    removeProject: (state, action) => {
      return state.filter(proj => proj.id !== action.payload.id);
    }
  }
});

export const { addProject, removeProject } = projectsSlice.actions;

export default projectsSlice.reducer;
```

**Forklaring:**

Den opprinnelige `removeProject`-reduceren filtrerte ut elementer som hadde samme `id` som `action.payload.id`, noe som resulterte i at ingen elementer ble fjernet fra listen. Ved å endre betingelsen til `proj.id !== action.payload.id`, fjernes elementet med den spesifikke `id` fra listen, som forventet.

</details>



### **Oppgave 5: Implementer asynkron logikk med `createAsyncThunk`**

**Instrukser:**

1. Bruk `createAsyncThunk` fra Redux Toolkit for å håndtere asynkron logikk (som f.eks. API-kall).
2. Legg til ekstra reducers for de ulike stadiene av asynkrone handlinger: `pending`, `fulfilled`, og `rejected`.

**Tips:** 
`createAsyncThunk` håndterer automatisk de forskjellige fasene av asynkrone handlinger for deg!

<details><summary>Løsning</summary>

```javascript
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';

export const fetchExperiences = createAsyncThunk(
  'experiences/fetchExperiences',
  async () => {
    const response = await fetch('API_URL_HERE');
    const data = await response.json();
    return data;
  }
);

const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {},
  extraReducers: builder => {
    builder
      .addCase(fetchExperiences.fulfilled, (state, action) => {
        return action.payload;
      })
  }
});

export default experiencesSlice.reducer;
```

</details>

### **Oppgave 6 (Valgfri): Introduksjon til `RTK Query`**

**Instrukser:**

1. Utforsk RTK Query, en kraftig datahentings- og caching-mekanisme innebygd i Redux Toolkit.
2. Implementer en funksjonalitet i CV-appen som henter data fra en API ved hjelp av RTK Query.

**Tips:** 
Det anbefales å lese [offisiell dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview) før du starter.

> [!TIP]  
> Når du er ferdig med oppgavene, kan du prøve å utforske mer av funksjonene som Redux Toolkit tilbyr. Toolkit er designet for å gjøre Redux enklere og mer effektivt, så det er definitivt verdt å dykke dypere inn i det!

<details><summary>Løsning</summary>

Denne oppgaven er mer av en utforskende natur. Det beste vil være å følge [offisiell dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview) for å implementere RTK Query.

#### **Utforskende Eksempler med RTK Query**

#### **1. Definere en API Slice for Erfaringer:**

Med RTK Query, kan du definere en API slice ved hjelp av `createApi` som vil håndtere alle CRUD-operasjonene for dine erfaringer.

```javascript
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';

export const api = createApi({
  baseQuery: fetchBaseQuery({ baseUrl: '/api' }),
  endpoints: (builder) => ({
    getExperiences: builder.query({
      query: () => 'experiences'
    }),
    addExperience: builder.mutation({
      query: (newExperience) => ({
        url: 'experiences',
        method: 'POST',
        body: newExperience
      })
    })
  })
});

export const { useGetExperiencesQuery, useAddExperienceMutation } = api;
```

#### **2. Hent Erfaringer i en Komponent:**

Bruk den genererte hook `useGetExperiencesQuery` for å hente erfaringene.

```javascript
import { useGetExperiencesQuery } from './apiSlice';

const ExperienceList = () => {
  const { data: experiences, isLoading, isError } = useGetExperiencesQuery();

  if (isLoading) return <div>Loading...</div>;
  if (isError) return <div>Error loading experiences</div>;

  // Render logikk for listen her...
}
```

#### **3. Legg til en ny Erfaring:**

Bruk den genererte mutation hook `useAddExperienceMutation` for å legge til en ny erfaring.

```javascript
import { useAddExperienceMutation } from './apiSlice';

const AddExperienceForm = () => {
  const [addExperience] = useAddExperienceMutation();

  const handleSubmit = (newExperience) => {
    addExperience(newExperience);
  }

  // Render form logikk her...
}
```

Disse eksemplene gir en enkel introduksjon til hvordan RTK Query kan brukes i sammenheng med prosjektet ditt. For en dypere forståelse og ytterligere funksjoner (som oppdatering, sletting, caching, osv.), sjekk [offisiell RTK Query dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview).

</details>

**Kilder**:
- [Redux Toolkit Official Documentation](https://redux-toolkit.js.org/)


