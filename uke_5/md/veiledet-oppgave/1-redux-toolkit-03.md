### **Oppgave 8: Lag en Slice for Utdanning**

**Introduksjon:**

I denne oppgaven skal vi lage en ny slice for å håndtere utdanningsinformasjon i applikasjonen. Dette vil hjelpe oss med å organisere og administrere utdanningsdata på en strukturert måte.

**Instrukser:**

1. Bruk `createSlice` fra Redux Toolkit for å lage en slice for `education`.
2. Definer initial tilstand, reducerne, og handlingene i samme fil.
3. Eksporter de nødvendige handlingene og reducere.

> [!NOTE]
> Husk å oppdatere redux store med din nye reducer

<details><summary>Løsning</summary>

```javascript
import { createSlice } from '@reduxjs/toolkit';

const educationSlice = createSlice({
  name: 'education',
  initialState: [],
  reducers: {
    addEducation: (state, action) => {
      state.push(action.payload);
    },
    removeEducation: (state, action) => {
      return state.filter(edu => edu.id !== action.payload.id);
    }
  }
});

export const { addEducation, removeEducation } = educationSlice.actions;

export default educationSlice.reducer;
```

**Begrunnelse:**

Ved å lage en egen slice for utdanning, kan vi enkelt administrere utdanningsdataene i applikasjonen. `createSlice` gjør det enkelt å definere initial tilstand, reducer-funksjoner, og action creators på en konsis måte.

</details>

### **Oppgave 9: Bruk `useDispatch` og `useSelector` for Utdanning**

**Introduksjon:**

I denne oppgaven skal vi oppdatere en komponent for å bruke `useDispatch` og `useSelector` for å håndtere utdanningsdata. Dette vil gjøre komponenten mer interaktiv og koblet til Redux store.

**Eksempelkode:**

```javascript
import React, { useState } from 'react';

const EducationList = () => {
  const [education, setEducation] = useState([]);

  const handleAdd = (edu) => {
    setEducation([...education, edu]);
  }

  const handleRemove = (id) => {
    setEducation(education.filter(edu => edu.id !== id));
  }

  return (
    <div>
      <h2>Education List</h2>
      <ul>
        {education.map((edu) => (
          <li key={edu.id}>
            {edu.name}
            <button onClick={() => handleRemove(edu.id)}>Remove</button>
          </li>
        ))}
      </ul>
      <button onClick={() => handleAdd({ id: Date.now(), name: 'New Education' })}>Add Education</button>
    </div>
  );
}

export default EducationList;
```

**Instrukser:**

1. Oppdater `EducationList` komponenten for å bruke `useDispatch` og `useSelector` fra `react-redux`.

<details><summary>Løsning</summary>

```javascript
import { useDispatch, useSelector } from 'react-redux';
import { addEducation, removeEducation } from './path-to-educationSlice';

const EducationList = () => {
  const education = useSelector((state) => state.education);
  const dispatch = useDispatch();

  const handleAdd = (edu) => {
    dispatch(addEducation(edu));
  }

  const handleRemove = (id) => {
    dispatch(removeEducation({ id }));
  }

  // Render logikk for listen her...
}
```

**Begrunnelse:**

Ved å bruke `useSelector` og `useDispatch` kan vi enkelt hente tilstanden fra Redux store og sende handlinger til Redux store. Dette gjør komponenten mer dynamisk og koblet til den globale tilstanden.

</details>

### **Oppgave 10: Lag en Slice for Ferdigheter**

**Introduksjon:**

I denne oppgaven skal vi lage en ny slice for å håndtere ferdigheter i applikasjonen. Dette vil hjelpe oss med å organisere og administrere ferdighetsdata på en strukturert måte.

**Instrukser:**

1. Bruk `createSlice` fra Redux Toolkit for å lage en slice for `skills`.
2. Definer initial tilstand, reducerne, og handlingene i samme fil.
3. Eksporter de nødvendige handlingene og reducere.

> [!NOTE]
> Husk å oppdatere redux store med din nye reducer

<details><summary>Løsning</summary>

```javascript
import { createSlice } from '@reduxjs/toolkit';

const skillsSlice = createSlice({
  name: 'skills',
  initialState: [],
  reducers: {
    addSkill: (state, action) => {
      state.push(action.payload);
    },
    removeSkill: (state, action) => {
      return state.filter(skill => skill.id !== action.payload.id);
    }
  }
});

export const { addSkill, removeSkill } = skillsSlice.actions;

export default skillsSlice.reducer;
```

**Begrunnelse:**

Ved å lage en egen slice for ferdigheter, kan vi enkelt administrere ferdighetsdataene i applikasjonen. `createSlice` gjør det enkelt å definere initial tilstand, reducer-funksjoner, og action creators på en konsis måte.

</details>

### **Oppgave 11: Bruk `useDispatch` og `useSelector` for Ferdigheter**

**Introduksjon:**

I denne oppgaven skal vi oppdatere en komponent for å bruke `useDispatch` og `useSelector` for å håndtere ferdighetsdata. Dette vil gjøre komponenten mer interaktiv og koblet til Redux store.

**Instrukser:**

1. Oppdater `SkillsList` komponenten for å bruke `useDispatch` og `useSelector` fra `react-redux`.

<details><summary>Løsning</summary>

```javascript
import { useDispatch, useSelector } from 'react-redux';
import { addSkill, removeSkill } from './path-to-skillsSlice';

const SkillsList = () => {
  const skills = useSelector((state) => state.skills);
  const dispatch = useDispatch();

  const handleAdd = (skill) => {
    dispatch(addSkill(skill));
  }

  const handleRemove = (id) => {
    dispatch(removeSkill({ id }));
  }

  // Render logikk for listen her...
}
```

**Begrunnelse:**

Ved å bruke `useSelector` og `useDispatch` kan vi enkelt hente tilstanden fra Redux store og sende handlinger til Redux store. Dette gjør komponenten mer dynamisk og koblet til den globale tilstanden.

</details>

### **Oppgave 12: Opprett en middleware for logging**

**Introduksjon:**

Middleware er en måte å utvide Redux med tilpasset funksjonalitet. I denne oppgaven skal vi opprette en middleware som logger alle handlinger som sendes til Redux store.

**Instrukser:**

1. Opprett en middleware som logger alle handlinger og tilstanden før og etter handlingen er behandlet.
2. Legg til denne middleware i Redux store.

<details><summary>Løsning</summary>

```javascript
import { configureStore, getDefaultMiddleware } from '@reduxjs/toolkit';
import experiencesReducer from './experiencesSlice';

// Logger middleware
const loggerMiddleware = storeAPI => next => action => {
  console.log('dispatching', action);
  let result = next(action);
  console.log('next state', storeAPI.getState());
  return result;
};

const store = configureStore({
  reducer: {
    experiences: experiencesReducer
  },
  middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat(loggerMiddleware)
});

export default store;
```

**Begrunnelse:**

Middleware gir deg muligheten til å utvide Redux med tilpasset funksjonalitet. Logger-middlewareen hjelper deg med å forstå hva som skjer i applikasjonen din ved å logge alle handlinger og tilstanden før og etter handlingen er behandlet. Dette er nyttig for debugging og overvåking.

</details>
