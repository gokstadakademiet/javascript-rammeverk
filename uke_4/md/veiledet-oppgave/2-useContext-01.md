## Oppgavesett: Interaktiv Online CV Webapplikasjon: `Hooks: useContext`


### **Oppgave 1: Grunnleggende om Context**
**Mål:** Introduksjon til Context i React.
**Beskrivelse:**  
Lag en `ThemeContext` som kan lagre informasjon om hvilket tema (lys eller mørk) som er valgt for applikasjonen. Bruk denne konteksten til å bytte mellom lys og mørk modus i en liten applikasjon.  

<details><summary>Løsning</summary> 

```javascript
import React, { createContext, useState } from 'react';

const ThemeContext = createContext();

const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState('light');

  const toggleTheme = () => {
    setTheme((prevTheme) => (prevTheme === 'light' ? 'dark' : 'light'));
  };

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

export { ThemeContext, ThemeProvider };
```

**Forklaring:**
Dette mønsteret lar deg opprette en global tilstand som kan være tilgjengelig i hvilken som helst komponent i applikasjonen ved hjelp av React Context. Ved å bruke `ThemeProvider` rundt hele appen din kan alle barna ha tilgang til temaet og funksjonaliteten for å bytte tema.

</details>

**Link:** [React Context](https://reactjs.org/docs/context.html)

### **Oppgave 2: Bruk av `useContext`**
**Mål:** Bli kjent med hvordan du kan bruke `useContext`-hooken.
**Beskrivelse:**  
Bygg videre på oppgave 1 ved å lage en `ThemeToggleButton`-komponent. Denne komponenten skal kunne bytte mellom lys og mørk modus ved å hente og sette temaet fra `ThemeContext` ved hjelp av `useContext`-hooken.   

<details><summary>Løsning</summary> 

```javascript
import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';

const ThemeToggleButton = () => {
  const { theme, toggleTheme } = useContext(ThemeContext);

  return <button onClick={toggleTheme}>{theme === 'light' ? 'Dark' : 'Light'} Mode</button>;
};
```

**Forklaring:**
Dette viser hvordan du enkelt kan konsumere verdier fra en Context i en funksjonskomponent ved hjelp av `useContext` hook.

</details>

**Link:** [Using the React useContext Hook](https://reactjs.org/docs/hooks-reference.html#usecontext)

### **Oppgave 3: Deling av state med Context**
**Mål:** Forstå hvordan state kan deles mellom komponenter med Context.
**Beskrivelse:**  
Lag en `UserContext` som kan lagre informasjon om den innloggede brukeren. Dette skal inkludere navn og profilbilde. Bruk denne konteksten til å vise brukerinformasjon i en `UserProfile`-komponent ved hjelp av `useContext`. 

<details><summary>Løsning</summary> 

```javascript
import React, { createContext, useState } from 'react';

const UserContext = createContext();

const UserProvider = ({ children }) => {
  const [user, setUser] = useState({ name: 'John Doe', profileImage: 'url_to_image' });

  return <UserContext.Provider value={user}>{children}</UserContext.Provider>;
};

const UserProfile = () => {
  const user = useContext(UserContext);
  
  return (
    <div>
      <img src={user.profileImage} alt='User Profile' />
      <p>{user.name}</p>
    </div>
  );
};
```

**Forklaring:**
På samme måte som temaeksemplet, demonstrerer dette hvordan du kan opprette en global tilstand for brukerdata som kan være tilgjengelig for alle komponentene i applikasjonen.

</details>

**Link:** [Sharing state using Context](https://kentcdodds.com/blog/application-state-management-with-react)

### **Oppgave 4: Optimalisering av Context-renders**
**Mål:** Lær hvordan du kan forhindre unødvendige re-renders når du bruker Context.
**Beskrivelse:**  
Bygg videre på oppgave 3 ved å optimalisere hvordan `UserContext` re-renders. Forsikre deg om at komponenter som bruker `UserContext` kun oppdateres når nødvendig.   
**Link:** [Optimizing context value](https://reactjs.org/docs/context.html#contextprovider)

<details><summary>Løsning</summary> 

**Tips:**
1. **Bruk `React.memo`:** Dette vil forhindre en komponent i å re-rendre med mindre dens props endrer seg.
2. **Unngå å opprette nye objekter i render:** Bruk `useMemo` for å memoisere objektverdier slik at de ikke blir opprettet på nytt hver gang komponenten rendres.
3. **Splitte Contexts:** Hvis en Context har mange verdier, kan det være effektivt å splitte det opp i mindre Contexts.

**Forklaring:**
Rådene her er fokusert på optimalisering for å sikre at komponenter som konsumerer Contexts ikke blir re-rendret unødvendig, noe som kan påvirke ytelsen i en React-applikasjon.

</details>
