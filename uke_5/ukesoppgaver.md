# Oppgavesett: Interaktiv Online CV Webapplikasjon: `React Router Dom` & `useContext`
# Innholdsfortegnelse 


## Oppgavesett: Interaktiv Online CV Webapplikasjon: `Redux Toolkit`

### **Introduksjon:**

Redux Toolkit er den offisielle, opinionated, batteri-inkluderte verktøykassen for Redux. Den lar deg skrive Redux-logikk med færre kodelinjer, og det blir enklere å forholde seg til. I disse oppgavene vil vi videreutvikle vår 'Interaktiv Online CV Webapplikasjon' ved å inkorporere Redux Toolkit.

### **Oppgave 1: Installer Redux Toolkit**

**Instrukser:**

1. Åpne ditt eksisterende prosjekt i terminalen.
2. Installer Redux Toolkit ved å kjøre kommandoen: 

```bash
npm install @reduxjs/toolkit react-redux
```

> [!IMPORTANT]  
> Sørg for at du har en fungerende internettforbindelse når du kjører installasjonskommandoen.

**Begrunnelse:**

Redux Toolkit er et bibliotek som hjelper deg med å håndtere tilstanden i din applikasjon på en enklere og mer strukturert måte. `react-redux` er et bindingsbibliotek som lar deg bruke Redux sammen med React.

### **Oppgave 2: Sett opp Redux Store med `configureStore`**

**Instrukser:**

1. I `store.js`, bruk `configureStore` fra Redux Toolkit for å opprette en Redux store.
2. Definer en `rootReducer` som kombinerer alle dine reducere (du kan bruke `combineReducers` fra `redux` hvis nødvendig).

> [!TIP]
> Redux Toolkit inneholder `combineReducers` innebygd i `configureStore`, så du trenger ikke å importere den separat!

**Løsning**

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

### **Oppgave 3: Lag en Slice for Erfaringer**

**Instrukser:**

1. Bruk `createSlice` fra Redux Toolkit for å lage en slice for `experiences`.
2. Definer tilstanden, reducerne, og handlingene i samme fil.
3. Eksporter de nødvendige handlingene og reducere.

> [!NOTE]  
> `createSlice` vil generere action creators for deg automatisk!

**Løsning**

<details><summary>Se full kode</summary>

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
</details>

**Begrunnelse:**

En slice i Redux Toolkit er en samling av Redux-logikk for en bestemt del av tilstanden. `createSlice` er en funksjon som lar deg definere initial tilstand, reducer-funksjoner, og action creators på en enkel måte. Dette gjør koden din mer lesbar og vedlikeholdbar.

### **Oppgave 4: Bruk `useDispatch` og `useSelector` fra Redux Toolkit**

**Instrukser:**

1. Oppdater `ExperienceList` komponenten for å bruke `useDispatch` og `useSelector` fra `react-redux`.
2. Erstatt alle `mapStateToProps` og `mapDispatchToProps` logikken med de nevnte hooks.

**Løsning**

<details><summary>Se full kode</summary>

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
</details>

**Begrunnelse:**

`useSelector` er en hook som lar deg hente tilstanden fra Redux store i en funksjonell komponent. `useDispatch` er en hook som lar deg sende handlinger til Redux store. Disse hookene erstatter behovet for `mapStateToProps` og `mapDispatchToProps`, og gjør koden din mer konsis og enklere å lese.

### **Oppgave 5: Feilsøking i Redux Toolkit**

**Introduksjon:**

I denne oppgaven skal du feilsøke en kode som inneholder en feil. Koden nedenfor er ment å legge til og fjerne erfaringer fra en liste. Din oppgave er å finne og rette feilen.

**Instrukser:**

1. Les gjennom koden nedenfor.
2. Identifiser feilen som forhindrer koden fra å fungere som forventet.
3. Rett feilen og forklar hva som var galt.

**Kodeeksempel:**

<details><summary>Se full kode</summary>

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
      return state.filter(exp => exp.id === action.payload.id);
    }
  }
});

export const { addExperience, removeExperience } = experiencesSlice.actions;

export default experiencesSlice.reducer;
```
</details>

### **Løsning:**

**Feil:**

Feilen i koden er i `removeExperience`-reduceren. Den nåværende implementeringen filtrerer ut elementer som har samme `id` som `action.payload.id`, men den burde filtrere ut elementer som har en annen `id` enn `action.payload.id`.

**Rettet kode:**

<details><summary>Se full kode</summary>

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
</details>

**Forklaring:**

Den opprinnelige `removeExperience`-reduceren filtrerte ut elementer som hadde samme `id` som `action.payload.id`, noe som resulterte i at ingen elementer ble fjernet fra listen. Ved å endre betingelsen til `exp.id !== action.payload.id`, fjernes elementet med den spesifikke `id` fra listen, som forventet.
-e 


### **Oppgave 5: Implementer asynkron logikk med `createAsyncThunk`**

I denne oppgaven skal vi bruke `createAsyncThunk` fra Redux Toolkit for å håndtere asynkron logikk, som for eksempel API-kall. Vi vil også legge til ekstra reducers for de ulike stadiene av asynkrone handlinger: `pending`, `fulfilled`, og `rejected`.

#### **Steg 1: Importere nødvendige funksjoner**

Først må vi importere `createSlice` og `createAsyncThunk` fra Redux Toolkit. `createSlice` brukes til å lage en slice av Redux state, mens `createAsyncThunk` brukes til å lage asynkrone handlinger.

<details><summary>Se full kode</summary>
```javascript
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
```
</details>

#### **Steg 2: Definere en asynkron handling**

Vi bruker `createAsyncThunk` til å definere en asynkron handling som henter data fra en API. Denne funksjonen tar to argumenter: en streng som identifiserer handlingen, og en asynkron funksjon som utfører API-kallet.

<details><summary>Se full kode</summary>
```javascript
export const fetchExperiences = createAsyncThunk(
  'experiences/fetchExperiences',
  async () => {
    const response = await fetch('API_URL_HERE');
    const data = await response.json();
    return data;
  }
);
```
</details>

> [!IMPORTANT]  
> Sørg for å erstatte `'API_URL_HERE'` med den faktiske URL-en til API-et du ønsker å hente data fra.

#### **Steg 3: Opprette en slice**

Nå skal vi opprette en slice ved hjelp av `createSlice`. En slice inneholder initial state, reducers, og ekstra reducers. Initial state er den opprinnelige tilstanden til slice, mens reducers er funksjoner som definerer hvordan state skal oppdateres.

<details><summary>Se full kode</summary>
```javascript
const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {},
  extraReducers: builder => {
    builder
      .addCase(fetchExperiences.pending, (state) => {
        // Håndterer pending state
      })
      .addCase(fetchExperiences.fulfilled, (state, action) => {
        return action.payload;
      })
      .addCase(fetchExperiences.rejected, (state) => {
        // Håndterer rejected state
      });
  }
});
```
</details>

> [!NOTE]  
> `extraReducers` brukes til å håndtere de ulike stadiene av asynkrone handlinger.

#### **Steg 4: Håndtere ulike stadier av asynkrone handlinger**

Vi bruker `builder` i `extraReducers` for å håndtere de ulike stadiene av asynkrone handlinger: `pending`, `fulfilled`, og `rejected`. Når handlingen er `pending`, kan vi for eksempel vise en lastemelding. Når handlingen er `fulfilled`, oppdaterer vi state med dataen vi har hentet. Når handlingen er `rejected`, kan vi håndtere feilmeldinger.

<details><summary>Se full kode</summary>
```javascript
const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: { data: [], status: 'idle', error: null },
  reducers: {},
  extraReducers: builder => {
    builder
      .addCase(fetchExperiences.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(fetchExperiences.fulfilled, (state, action) => {
        state.status = 'succeeded';
        state.data = action.payload;
      })
      .addCase(fetchExperiences.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message;
      });
  }
});
```
</details>

> [!TIP]
> Initial state kan inneholde flere egenskaper som `status` og `error` for å håndtere ulike stadier og feil i asynkrone handlinger.

#### **Steg 5: Eksportere reduceren**

Til slutt eksporterer vi reduceren slik at den kan brukes i Redux store.

<details><summary>Se full kode</summary>
```javascript
export default experiencesSlice.reducer;
```
</details>

### **Oppgave 6 (Valgfri): Introduksjon til `RTK Query`**

I denne oppgaven skal vi utforske RTK Query, en kraftig datahentings- og caching-mekanisme innebygd i Redux Toolkit. Vi vil implementere en funksjonalitet i CV-appen som henter data fra en API ved hjelp av RTK Query.

#### **Steg 1: Definere en API Slice**

Med RTK Query kan du definere en API slice ved hjelp av `createApi`. Denne funksjonen håndterer alle CRUD-operasjonene for dine data. Vi starter med å importere nødvendige funksjoner og definere en API slice.

<details><summary>Se full kode</summary>
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
</details>

> [!CAUTION]
> Sørg for at `baseUrl` er korrekt satt opp for å unngå feil ved API-kall.

#### **Steg 2: Hente data i en komponent**

Vi bruker den genererte hook `useGetExperiencesQuery` for å hente data i en React-komponent. Denne hooken returnerer data, en lastestatus, og en feilmelding hvis noe går galt.

<details><summary>Se full kode</summary>
```javascript
import { useGetExperiencesQuery } from './apiSlice';

const ExperienceList = () => {
  const { data: experiences, isLoading, isError } = useGetExperiencesQuery();

  if (isLoading) return <div>Loading...</div>;
  if (isError) return <div>Error loading experiences</div>;

  return (
    <ul>
      {experiences.map(experience => (
        <li key={experience.id}>{experience.title}</li>
      ))}
    </ul>
  );
}
```
</details>

> [!TIP]
> Bruk `isLoading` og `isError` for å vise passende meldinger til brukeren mens data hentes eller hvis det oppstår en feil.

#### **Steg 3: Legge til ny data**

Vi bruker den genererte mutation hook `useAddExperienceMutation` for å legge til ny data. Denne hooken returnerer en funksjon som kan kalles for å utføre mutasjonen.

<details><summary>Se full kode</summary>
```javascript
import { useAddExperienceMutation } from './apiSlice';

const AddExperienceForm = () => {
  const [addExperience] = useAddExperienceMutation();

  const handleSubmit = (newExperience) => {
    addExperience(newExperience);
  }

  return (
    <form onSubmit={handleSubmit}>
      <input type="text" name="title" placeholder="Experience Title" />
      <button type="submit">Add Experience</button>
    </form>
  );
}
```
</details>

> [!NOTE]  
> Sørg for å validere inputdata før du sender den til API-et for å unngå feil.

Disse eksemplene gir en enkel introduksjon til hvordan RTK Query kan brukes i prosjektet ditt. For en dypere forståelse og ytterligere funksjoner, som oppdatering, sletting, og caching, anbefales det å lese den [offisielle RTK Query dokumentasjonen](https://redux-toolkit.js.org/rtk-query/overview).

**Kilder**:
- [Redux Toolkit Official Documentation](https://redux-toolkit.js.org/)
-e 


