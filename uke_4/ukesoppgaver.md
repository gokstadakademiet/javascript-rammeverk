# Oppgavesett: Interaktiv Online CV Webapplikasjon: `React Router Dom` & `useContext`
# Innholdsfortegnelse 


## Oppgavesett: Interaktiv Online CV Webapplikasjon: `React router dom V`

### **Oppgave 1: Sette opp react-router-dom V6**
**Mål:** Bli kjent med installasjon og oppsett av `react-router-dom` versjon 6 i din React applikasjon.
**Beskrivelse:**  
Installer og konfigurer `react-router-dom` v6 i din eksisterende CV webapplikasjon. Sett opp grunnleggende ruting for hjemmesiden og en side som viser detaljert CV informasjon.


<details><summary>Løsning</summary> 

For å starte, installer `react-router-dom` via npm:

```bash
npm install react-router-dom@6
```

Opprett en grunnleggende ruting:

```javascript
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<HomePage />} />
        <Route path='/cv' element={<CvPage />} />
      </Routes>
    </Router>
  );
}
```

**Forklaring:**  
Vi har installert `react-router-dom` v6 og satt opp ruter for både hjemmesiden og CV-siden ved hjelp av `<Router>`, `<Routes>` og `<Route>` komponentene.

</details>

**Link:** [React Router Getting Started](https://reactrouter.com/docs/en/v6/getting-started/overview)

### **Oppgave 2: Navigasjon mellom sider**
**Mål:** Forstå hvordan man bruker `Link` og `NavLink` for navigasjon.
**Beskrivelse:**  
Lag en enkel navigasjonsmeny som lar brukere veksle mellom hovedsiden og den detaljerte CV-siden. Utforsk forskjellen mellom `Link` og `NavLink`.

<details><summary>Løsning</summary> 

Bruk `Link` og `NavLink` for å lage en enkel navigasjon:

```javascript
import { Link, NavLink } from 'react-router-dom';

const Navigation = () => {
  return (
    <nav>
      <Link to='/'>Home</Link>
      <NavLink to='/cv' activeClassName='active'>Detailed CV</NavLink>
    </nav>
  );
}
```

**Forklaring:**  
`Link` og `NavLink` blir brukt for navigasjon. Forskjellen er at `NavLink` gir mulighet for å style den aktive lenken ved hjelp av `activeClassName` eller `activeStyle`.

</details>

**Link:** [React Router Links and Navigation](https://reactrouter.com/docs/en/v6/api#link)

### **Oppgave 3: Nested Routes**
**Mål:** Utforske hvordan man kan lage nestede ruter med `react-router-dom` v6.
**Beskrivelse:**  
På den detaljerte CV-siden, lag nestede ruter som viser forskjellige seksjoner av CV-en, som for eksempel arbeidserfaring, utdanning og ferdigheter.

**Link:** [React Router Nested Routes](https://reactrouter.com/docs/en/v6/examples/nesting)

<details><summary>Løsning</summary> 

```javascript
const CvPage = () => {
  return (
    <div>
      <Routes>
        <Route path='/' element={<Overview />} />
        <Route path='experience' element={<Experience />} />
        <Route path='education' element={<Education />} />
        <Route path='skills' element={<Skills />} />
      </Routes>
    </div>
  );
}
```

**Forklaring:**  
Ved hjelp av nested ruting, kan vi vise forskjellige deler av CV-en basert på den valgte stien.

</details>

### **Oppgave 4: Bruk av useParams**
**Mål:** Forstå hvordan man henter rute-parametere ved hjelp av `useParams` hook.
**Beskrivelse:**  
Legg til en funksjon som lar brukere se detaljert informasjon om en bestemt jobberfaring ved å klikke på den. Bruk `useParams` for å hente IDen for jobberfaringen fra URLen og vise den relevante informasjonen.

<details><summary>Løsning</summary> 

```javascript
import { useParams } from 'react-router-dom';

const JobDetail = () => {
  let { id } = useParams();
  // Finn jobberfaringen basert på ID og vis detaljene.
}
```

**Forklaring:**  
Med `useParams`, kan vi hente ut parametre fra URLen, som for eksempel IDen til en jobberfaring.

**Link:** [React Router useParams](https://reactrouter.com/docs/en/v6/api#useparams)

</details>



### **Oppgave 5: Redirects og Navigation Guards**
**Mål:** Utforske hvordan man kan håndtere omdirigeringer og sette opp navigasjonsbeskyttelser.
**Beskrivelse:**  
Lag en enkel innloggingsside. Når brukere prøver å få tilgang til den detaljerte CV-siden uten å være logget inn, skal de bli omdirigert til innloggingssiden. Etter vellykket innlogging, omdiriger brukeren tilbake til den detaljerte CV-siden.

<details><summary>Løsning</summary> 

Bruk `useNavigate` for omdirigering:

```javascript
import { Routes, Route, Outlet, useNavigate } from 'react-router-dom';

const CvPage = () => {
  let navigate = useNavigate();
  let loggedIn = // sjekk om brukeren er logget inn
  
  if (!loggedIn) {
    navigate('/login');
  }

  return <Outlet />;
}
```

**Forklaring:**  
Hvis brukeren ikke er logget inn, vil de bli omdirigert til innloggingssiden ved hjelp av `useNavigate`.

</details>

**Link:** [React Router Redirects](https://reactrouter.com/docs/en/v6/api#usehistory)

### **Oppgave 6: 404 NotFound Side**
**Mål:** Lære hvordan man håndterer ukjente ruter ved å vise en 404 side.
**Beskrivelse:**  
Legg til en 404 NotFound side i applikasjonen din. Når brukere besøker en rute som ikke finnes, skal de bli tatt til denne siden.

<details><summary>Løsning</summary> 

```javascript
const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<HomePage />} />
        <Route path='/cv' element={<CvPage />} />
        <Route path='*' element={<NotFound />} />
      </Routes>
    </Router>
  );
}
```

**Forklaring:**  
Ved hjelp av en sti på `*`, vil hvilken som helst rute som ikke allerede er definert, matche `NotFound` komponenten.

</details>

**Link:** [Handling 404 pages with React Router](https://reactrouter.com/docs/en/v6/guides/no-match)

## Ekstra utfordringsoppgaver:
### **Oppgave 7: Bruk av useLocation**
**Mål:** Utforske hvordan man kan få tilgang til den gjeldende lokasjonens informasjon ved hjelp av `useLocation` hook.
**Beskrivelse:**  
Vis en breadcrumb-navigasjon på den detaljerte CV-siden basert på den gjeldende ruten. Bruk `useLocation` for å hente den nødvendige informasjonen om ruten.

<details><summary>Løsning</summary> 

```javascript
import { useLocation } from 'react-router-dom';

const Breadcrumbs = () => {
  let location = useLocation();
  // Kode for å vise breadcrumbs basert på den gjeldende plasseringen.
}
```

**Forklaring:**  
Med `useLocation`, kan vi få informasjon om den gjeldende plasseringen og bygge en breadcrumb-navigasjon basert på dette.

Husk at disse løsningsforslagene er grunnleggende eksempler. Du kan utvide og tilpasse dem basert på spesifikke krav eller forbedringer du ønsker å implementere i applikasjonen din.

</details>

**Link:** [React Router useLocation](https://reactrouter.com/docs/en/v6/api#uselocation)


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



### **Oppgave 5: Context med andre hooks**
**Mål:** Forstå hvordan `useContext` kan kombineres med andre hooks for å lage kraftfulle løsninger.
**Beskrivelse:**  
Bygg videre på oppgave 1 og 2 ved å legge til en funksjon i `ThemeContext` som lar deg lagre brukerens temapreferanse i lokal lagring ved hjelp av `useEffect`. Hver gang temaet endres, skal denne preferansen lagres.  

<details><summary>Løsning</summary> 

```javascript
import React, { useState, useEffect, useContext } from 'react';
import { ThemeContext, ThemeProvider } from './ThemeContext';

const App = () => {
  const { theme } = useContext(ThemeContext);

  useEffect(() => {
    localStorage.setItem('preferred-theme', theme);
  }, [theme]);

  return <div className={theme}>{/* Rest of your app components */}</div>;
};
```

**Forklaring:**
Dette eksemplet viser hvordan du kan kombinere flere React-hooks for å oppnå en mer kompleks funksjonalitet. Her blir brukerens valg av tema lagret i nettleserens `localStorage` slik at valget huskes selv etter at siden lastes på nytt.

</details>

**Link:** [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html)

### **Oppgave 6: Nested Contexts**
**Mål:** Utforsk hvordan forskjellige kontekster kan nestes for å tilby ulike lag av data.
**Beskrivelse:**  
Tenk deg at du har både `ThemeContext` og `UserContext` fra de tidligere oppgavene. Bygg en komponentstruktur som bruker begge kontekster, og se hvordan data fra begge kan hentes i en enkelt komponent.   

<details><summary>Løsning</summary> 

```javascript
import { ThemeProvider } from './ThemeContext';
import { UserProvider } from './UserContext';

const App = () => (
  <ThemeProvider>
    <UserProvider>
      {/* Rest of your app components */}
    </UserProvider>
  </ThemeProvider>
);
```

**Forklaring:**
Dette mønsteret er nyttig når du har flere globale tilstander (f.eks. tema, brukerdata) som du vil gjøre tilgjengelig for hele applikasjonen. Ved å nøste Providers kan underliggende komponenter konsumere verdier fra alle tilgjengelige Contexts.

</details>

**Link:** [React Context](https://reactjs.org/docs/context.html)

### **Oppgave 7: Testing med Context**
**Mål:** Lær hvordan du kan teste komponenter som bruker Context.
**Beskrivelse:**  
Skriv tester for `UserProfile`-komponenten fra Oppgave 3 ved å bruke `jest` og `@testing-library/react`. Lær hvordan du kan 'mock' `UserContext` for å levere falske data under testing.

<details><summary>Løsning</summary> 

```javascript
import { render } from '@testing-library/react';
import { UserContext, UserProfile } from './UserContext';

test('renders user profile', () => {
  const user = { name: 'John Doe', profileImage: 'url_to_image' };

  const { getByText, getByAltText } = render(
    <UserContext.Provider value={user}>
      <UserProfile />
    </UserContext.Provider>
  );

  expect(getByText('John Doe')).toBeInTheDocument();
  expect(getByAltText('User Profile')).toBeInTheDocument();
});
```

**Forklaring:**
Dette eksemplet viser hvordan du kan gjøre 'mocking' av Context ved å bruke den faktiske `Provider` i testen, og sende inn mockede verdier for testing.

</details>

**Link:** [Testing React Components that use Context](https://kentcdodds.com/blog/how-to-test-custom-react-hooks)

## Ekstra utfordringsoppgaver:

### **Oppgave 8: Dynamiske Contexts**
**Mål:** Dykk dypere inn i hvordan du kan lage dynamiske kontekster.
**Beskrivelse:**  
Lag en kontekst som kan bytte språk for din applikasjon (for eksempel norsk, engelsk). Bygg en knapp som lar brukeren bytte mellom disse språkene, og vis teksten på applikasjonen i valgt språk. 

<details><summary>Løsning</summary> 

**Forklaring:**
I noen tilfeller, som for internasjonalisering, kan du trenge mer dynamiske Contexts. Biblioteker som `react-intl` eller `i18next` kan hjelpe med å opprette en dynamisk kontekst som håndterer ulike språk.

</details>

### **Oppgave 9: Bruk av `useReducer` med Context**
**Mål:** Se hvordan `useReducer` kan kombineres med `useContext` for kompleks statshåndtering.
**Beskrivelse:**  
Implementer en handlekurvfunksjon for en e-handelsapplikasjon ved å bruke `useReducer` sammen med en `CartContext`. Dette skal tillate å legge til produkter, fjerne produkter og tømme handlekurven.   

<details><summary>Løsning</summary> 

```javascript
import React, { createContext, useReducer } from 'react';

const CartContext = createContext();

const cartReducer = (state, action) => {
  switch (action.type) {
    case 'ADD_ITEM':
      return [...state, action.item];
    case 'REMOVE_ITEM':
      return state.filter((item) => item.id !== action.id);
    default:
      return state;
  }
};

const CartProvider = ({ children }) => {
  const [cart, dispatch] = useReducer(cartReducer, []);

  return <CartContext.Provider value={{ cart, dispatch }}>{children}</CartContext.Provider>;
};
```

**Forklaring:**
`useReducer` er en nyttig hook for komplekse tilstandshåndteringsscenarier, hvor du har mange relaterte handlinger som kan påvirke tilstanden. Ved å kombinere `useReducer` med Context kan du opprette en global tilstandshåndteringsløsning som ligner på Redux.

</details>

**Link:** [Hooks API Reference - useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer)



