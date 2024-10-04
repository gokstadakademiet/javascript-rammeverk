# Uke 4

## Oppgavesett: Interaktiv Online CV Webapplikasjon: `React router dom V`

### **Oppgave 1: Sette opp react-router-dom v6**
**Mål:** Bli kjent med installasjon og oppsett av `react-router-dom` versjon 6 i din React applikasjon.
**Beskrivelse:**  
Installer og konfigurer `react-router-dom` v6 i din eksisterende CV webapplikasjon. Sett opp grunnleggende ruting for hjemmesiden og en side som viser detaljert CV informasjon.

**Link:** [React Router Getting Started](https://reactrouter.com/docs/en/v6/getting-started/overview)

### **Oppgave 2: Navigasjon mellom sider**
**Mål:** Forstå hvordan man bruker `Link` og `NavLink` for navigasjon.
**Beskrivelse:**  
Lag en enkel navigasjonsmeny som lar brukere veksle mellom hovedsiden og den detaljerte CV-siden. Utforsk forskjellen mellom `Link` og `NavLink`.

**Link:** [React Router Links and Navigation](https://reactrouter.com/docs/en/v6/api#link)

### **Oppgave 3: Nested Routes**
**Mål:** Utforske hvordan man kan lage nestede ruter med `react-router-dom` v6.
**Beskrivelse:**  
På den detaljerte CV-siden, lag nestede ruter som viser forskjellige seksjoner av CV-en, som for eksempel arbeidserfaring, utdanning og ferdigheter.

**Link:** [React Router Nested Routes](https://reactrouter.com/docs/en/v6/examples/nesting)

### **Oppgave 4: Bruk av useParams**
**Mål:** Forstå hvordan man henter rute-parametere ved hjelp av `useParams` hook.
**Beskrivelse:**  
Legg til en funksjon som lar brukere se detaljert informasjon om en bestemt jobberfaring ved å klikke på den. Bruk `useParams` for å hente IDen for jobberfaringen fra URLen og vise den relevante informasjonen.

**Link:** [React Router useParams](https://reactrouter.com/docs/en/v6/api#useparams)

### **Oppgave 5: Redirects og Navigation Guards**
**Mål:** Utforske hvordan man kan håndtere omdirigeringer og sette opp navigasjonsbeskyttelser.
**Beskrivelse:**  
Lag en enkel innloggingsside. Når brukere prøver å få tilgang til den detaljerte CV-siden uten å være logget inn, skal de bli omdirigert til innloggingssiden. Etter vellykket innlogging, omdiriger brukeren tilbake til den detaljerte CV-siden.

**Link:** [React Router Redirects](https://reactrouter.com/docs/en/v6/api#usehistory)

### **Oppgave 6: 404 NotFound Side**
**Mål:** Lære hvordan man håndterer ukjente ruter ved å vise en 404 side.
**Beskrivelse:**  
Legg til en 404 NotFound side i applikasjonen din. Når brukere besøker en rute som ikke finnes, skal de bli tatt til denne siden.

**Link:** [Handling 404 pages with React Router](https://reactrouter.com/docs/en/v6/guides/no-match)

## Ekstra utfordringsoppgaver:
### **Oppgave 7: Bruk av useLocation**
**Mål:** Utforske hvordan man kan få tilgang til den gjeldende lokasjonens informasjon ved hjelp av `useLocation` hook.
**Beskrivelse:**  
Vis en breadcrumb-navigasjon på den detaljerte CV-siden basert på den gjeldende ruten. Bruk `useLocation` for å hente den nødvendige informasjonen om ruten.

**Link:** [React Router useLocation](https://reactrouter.com/docs/en/v6/api#uselocation)



## Oppgavesett: Interaktiv Online CV Webapplikasjon: `Hooks: useContext`


### **Oppgave 1: Grunnleggende om Context**
**Mål:** Introduksjon til Context i React.
**Beskrivelse:**  
Lag en `ThemeContext` som kan lagre informasjon om hvilket tema (lys eller mørk) som er valgt for applikasjonen. Bruk denne konteksten til å bytte mellom lys og mørk modus i en liten applikasjon.  
**Link:** [React Context](https://reactjs.org/docs/context.html)

### **Oppgave 2: Bruk av `useContext`**
**Mål:** Bli kjent med hvordan du kan bruke `useContext`-hooken.
**Beskrivelse:**  
Bygg videre på oppgave 1 ved å lage en `ThemeToggleButton`-komponent. Denne komponenten skal kunne bytte mellom lys og mørk modus ved å hente og sette temaet fra `ThemeContext` ved hjelp av `useContext`-hooken.   
**Link:** [Using the React useContext Hook](https://reactjs.org/docs/hooks-reference.html#usecontext)

### **Oppgave 3: Deling av state med Context**
**Mål:** Forstå hvordan state kan deles mellom komponenter med Context.
**Beskrivelse:**  
Lag en `UserContext` som kan lagre informasjon om den innloggede brukeren. Dette skal inkludere navn og profilbilde. Bruk denne konteksten til å vise brukerinformasjon i en `UserProfile`-komponent ved hjelp av `useContext`.   
**Link:** [Sharing state using Context](https://kentcdodds.com/blog/application-state-management-with-react)

### **Oppgave 4: Optimalisering av Context-renders**
**Mål:** Lær hvordan du kan forhindre unødvendige re-renders når du bruker Context.
**Beskrivelse:**  
Bygg videre på oppgave 3 ved å optimalisere hvordan `UserContext` re-renders. Forsikre deg om at komponenter som bruker `UserContext` kun oppdateres når nødvendig.   
**Link:** [Optimizing context value](https://reactjs.org/docs/context.html#contextprovider)

### **Oppgave 5: Context med andre hooks**
**Mål:** Forstå hvordan `useContext` kan kombineres med andre hooks for å lage kraftfulle løsninger.
**Beskrivelse:**  
Bygg videre på oppgave 1 og 2 ved å legge til en funksjon i `ThemeContext` som lar deg lagre brukerens temapreferanse i lokal lagring ved hjelp av `useEffect`. Hver gang temaet endres, skal denne preferansen lagres.  
**Link:** [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html)

### **Oppgave 6: Nested Contexts**
**Mål:** Utforsk hvordan forskjellige kontekster kan nestes for å tilby ulike lag av data.
**Beskrivelse:**  
Tenk deg at du har både `ThemeContext` og `UserContext` fra de tidligere oppgavene. Bygg en komponentstruktur som bruker begge kontekster, og se hvordan data fra begge kan hentes i en enkelt komponent.   
**Link:** [React Context](https://reactjs.org/docs/context.html)

### **Oppgave 7: Testing med Context**
**Mål:** Lær hvordan du kan teste komponenter som bruker Context.
**Beskrivelse:**  
Skriv tester for `UserProfile`-komponenten fra Oppgave 3 ved å bruke `jest` og `@testing-library/react`. Lær hvordan du kan 'mock' `UserContext` for å levere falske data under testing.   
**Link:** [Testing React Components that use Context](https://kentcdodds.com/blog/how-to-test-custom-react-hooks)

## Ekstra utfordringsoppgaver:

### **Oppgave 8: Dynamiske Contexts**
**Mål:** Dykk dypere inn i hvordan du kan lage dynamiske kontekster.
**Beskrivelse:**  
Lag en kontekst som kan bytte språk for din applikasjon (for eksempel norsk, engelsk). Bygg en knapp som lar brukeren bytte mellom disse språkene, og vis teksten på applikasjonen i valgt språk. 

### **Oppgave 9: Bruk av `useReducer` med Context**
**Mål:** Se hvordan `useReducer` kan kombineres med `useContext` for kompleks statshåndtering.
**Beskrivelse:**  
Implementer en handlekurvfunksjon for en e-handelsapplikasjon ved å bruke `useReducer` sammen med en `CartContext`. Dette skal tillate å legge til produkter, fjerne produkter og tømme handlekurven.   
**Link:** [Hooks API Reference - useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer)
