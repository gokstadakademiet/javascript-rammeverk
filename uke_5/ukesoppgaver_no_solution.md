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


### **Oppgave 3: Lag en Slice for Erfaringer**

**Instrukser:**

1. Bruk `createSlice` fra Redux Toolkit for å lage en slice for `experiences`.
2. Definer tilstanden, reducerne, og handlingene i samme fil.
3. Eksporter de nødvendige handlingene og reducere.


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




### **Oppgave 5: Implementer asynkron logikk med `createAsyncThunk`**

**Instrukser:**

1. Bruk `createAsyncThunk` fra Redux Toolkit for å håndtere asynkron logikk (som f.eks. API-kall).
2. Legg til ekstra reducers for de ulike stadiene av asynkrone handlinger: `pending`, `fulfilled`, og `rejected`.

**Tips:** 
`createAsyncThunk` håndterer automatisk de forskjellige fasene av asynkrone handlinger for deg!


### **Oppgave 6 (Valgfri): Introduksjon til `RTK Query`**

**Instrukser:**

1. Utforsk RTK Query, en kraftig datahentings- og caching-mekanisme innebygd i Redux Toolkit.
2. Implementer en funksjonalitet i CV-appen som henter data fra en API ved hjelp av RTK Query.

**Tips:** 
Det anbefales å lese [offisiell dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview) før du starter.

> [!TIP]  
> Når du er ferdig med oppgavene, kan du prøve å utforske mer av funksjonene som Redux Toolkit tilbyr. Toolkit er designet for å gjøre Redux enklere og mer effektivt, så det er definitivt verdt å dykke dypere inn i det!


**Kilder**:
- [Redux Toolkit Official Documentation](https://redux-toolkit.js.org/)


