## Oppgavesett: Interaktiv Online CV Webapplikasjon: `React router dom V`

### **Oppgave 1: Sette opp react-router-dom v6**
**Mål:** Bli kjent med installasjon og oppsett av `react-router-dom` versjon 6 i din React applikasjon.
**Beskrivelse:**  
Installer og konfigurer `react-router-dom` v6 i din eksisterende CV webapplikasjon. Sett opp grunnleggende ruting for hjemmesiden og en side som viser detaljert CV informasjon.


**Løsning:** 

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

**Link:** [React Router Getting Started](https://reactrouter.com/docs/en/v6/getting-started/overview)

### **Oppgave 2: Navigasjon mellom sider**
**Mål:** Forstå hvordan man bruker `Link` og `NavLink` for navigasjon.
**Beskrivelse:**  
Lag en enkel navigasjonsmeny som lar brukere veksle mellom hovedsiden og den detaljerte CV-siden. Utforsk forskjellen mellom `Link` og `NavLink`.

**Løsning:** 

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

**Link:** [React Router Links and Navigation](https://reactrouter.com/docs/en/v6/api#link)

### **Oppgave 3: Nested Routes**
**Mål:** Utforske hvordan man kan lage nestede ruter med `react-router-dom` v6.
**Beskrivelse:**  
På den detaljerte CV-siden, lag nestede ruter som viser forskjellige seksjoner av CV-en, som for eksempel arbeidserfaring, utdanning og ferdigheter.

**Link:** [React Router Nested Routes](https://reactrouter.com/docs/en/v6/examples/nesting)

**Løsning:** 

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

### **Oppgave 4: Bruk av useParams**
**Mål:** Forstå hvordan man henter rute-parametere ved hjelp av `useParams` hook.
**Beskrivelse:**  
Legg til en funksjon som lar brukere se detaljert informasjon om en bestemt jobberfaring ved å klikke på den. Bruk `useParams` for å hente IDen for jobberfaringen fra URLen og vise den relevante informasjonen.

**Løsning:** 

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