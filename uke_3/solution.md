# Uke 3

## Innføring i `Jest` og `Debugging` teknikker

### **Løsningsforslag Oppgave 1: Basic Logging**

**Løsning:** 
For å introdusere logging, kan du bruke `console.log()` på strategiske steder i koden:

```javascript
const addSkill = (skill) => {
  console.log('Adding skill at:', new Date());
  console.log('Skill:', skill);
  // Resten av koden som legger til ferdigheten
}
```

**Forklaring:** 
Ved å logge tidspunktet og ferdigheten, kan vi bekrefte at ferdigheten blir lagt til som forventet.

### **Løsningsforslag Oppgave 2: Jest Grunnleggende - Testing av Funksjoner**

**Løsning:** 

```javascript
// formatPhone.js
const formatPhone = (phone) => {
  // Formatering logikk
}

// formatPhone.test.js
test('formats phone numbers correctly', () => {
  expect(formatPhone('12345678')).toBe('+47-12345678');
  // ... flere tester
});
```

**Forklaring:** 
Med Jest, kan vi enkelt skrive tester for funksjoner som [`formatPhone`](command:_github.copilot.openSymbolFromReferences?%5B%22%22%2C%5B%7B%22uri%22%3A%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2FUsers%2Fandreaswilhelmflatt%2FDocuments%2FStratus%20Holding%20AS%2FKunder%2FGokstad%20Akademiet%20AS%2Fjavascript-rammeverk%2F2024%2Fukesoppgaver%2Fawf-javascript-rammeverk%2Fuke_3%2Fsolution.md%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%2C%22pos%22%3A%7B%22line%22%3A25%2C%22character%22%3A3%7D%7D%5D%2C%221dda16be-7c37-4019-bed3-4884063976e8%22%5D "Go to definition") for å sikre at de virker som forventet.

### **Løsningsforslag Oppgave 3: Testing av Data Manipulering**

**Løsning:** 

```javascript
// skills.test.js
test('adds a skill to the list', () => {
  const skills = ['JavaScript'];
  addSkill('React');
  expect(skills).toContain('React');
});
```

**Forklaring:** 
Med Jest, kan vi skrive tester for funksjoner som legger til eller fjerner ferdigheter fra en liste for å sikre korrekt funksjonalitet.

### **Løsningsforslag Oppgave 4: Testing av UI-komponenter med Jest**

**Løsning:** 

```javascript
// Using @testing-library/react
import { render, fireEvent } from '@testing-library/react';
import EditButton from './EditButton';

test('opens edit window on click', () => {
  const { getByText } = render(<EditButton />);
  fireEvent.click(getByText('Edit'));
  // Bekreft at redigeringsvinduet åpnes
});
```

**Forklaring:** 
Med kombinasjonen av Jest og `@testing-library/react`, kan vi simulere brukerinteraksjoner og teste UI-komponenter.

### **Løsningsforslag Oppgave 5: Snapshot Testing**

**Løsning:** 

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

**Forklaring:** 
Med snapshot testing, kan vi sikre at komponentens output ikke endres utilsiktet over tid.

### **Løsningsforslag Oppgave 6: Simulering av Brukerinteraksjon med End-to-End Testing**

**Løsning:** 

```javascript
// Using Cypress
describe('CV Application Interactions', () => {
  it('simulates user adding, editing, and deleting a job experience', () => {
    cy.visit('/cv');
    cy.get('[data-cy=add-experience-button]').click();
    // ... resten av interaksjonene
  });
});
```

**Forklaring:** 
Med Cypress, kan vi simulere en hel brukeropplevelse fra start til slutt.

### **Løsningsforslag Oppgave 7: Integrasjonstesting**

**Løsning:** 

```javascript
// Using Jest
test('skills integration', () => {
  addSkill('React');
  addSkill('JavaScript');
  expect(getSkillsList()).toContain('React');
  expect(getSkillsList()).toContain('JavaScript');
});
```

**Forklaring:** 
Integrasjonstesting hjelper oss med å bekrefte at ulike deler av applikasjonen fungerer sammen som forventet.

### **Løsningsforslag Oppgave 8: Feilsøking ved Bruk av Breakpoints**

**Løsning:** 
Ved bruk av utviklerverktøyene i nettleseren (for eksempel Chrome DevTools), kan man sette breakpoints i koden for å pause utførelsen og inspisere dataene. Dette er mer en manuell prosess enn en kodebit, men det er svært verdifullt for feilsøking.

**Forklaring:** 
Breakpoints lar deg pause koden på et spesifikt punkt og sjekke verdien av variabler, flyten i koden, og mer for å identifisere og løse problemer.

> Husk at disse løsningsforslagene er grunnleggende eksempler. Du kan utvide og tilpasse dem basert på spesifikke krav eller forbedringer du ønsker å implementere i applikasjonen din.

---



## Innføring i `PropTypes` & `TypeScript`

**Trinnvis Løsning:**

1. **Opprett en ny React-komponent kalt `Profile`:**  
   Begynn med å opprette en ny fil kalt `Profile.js` i prosjektets komponentmappe.

2. **Skriv komponenten:**  
   Innenfor `Profile.js`, importer React og PropTypes:

   ```javascript
   import React from 'react';
   import PropTypes from 'prop-types';
   ```

   Deretter, opprett `Profile`-komponenten:

   ```javascript
   const Profile = ({ name, age, experience }) => {
     return (
       <div>
         <h2>{name}</h2>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };
   ```

3. **Legg til PropTypes:**  
   Under komponenten, definer PropTypes for `Profile`:

   ```javascript
   Profile.propTypes = {
     name: PropTypes.string.isRequired,
     age: PropTypes.number.isRequired,
     experience: PropTypes.arrayOf(
       PropTypes.shape({
         title: PropTypes.string.isRequired,
         years: PropTypes.number.isRequired,
       })
     ).isRequired,
   };
   ```

   Deretter, eksporter `Profile`-komponenten:

   ```javascript
   export default Profile;
   ```

**Forklaring:**

PropTypes gir typekontroll for props som sendes til en React-komponent. Dette bidrar til å fange feil tidligere i utviklingsprosessen. I denne oppgaven, ved å bruke PropTypes, sikrer vi at `Profile`-komponenten mottar riktige typer for `name`, `age` og `experience`. Dette bidrar til å forbedre robustheten og forutsigbarheten av komponenten.

For `experience`, har vi brukt `arrayOf` kombinert med `shape` for å spesifisere at det er en array av objekter, hvor hvert objekt har bestemte nøkler med bestemte typer.

[React PropTypes and type checking](https://reactjs.org/docs/typechecking-with-proptypes.html)  
[PropTypes on GitHub](https://github.com/facebook/prop-types)


### **Løsningsforslag til Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt**

**Trinnvis Løsning:**

1. **Installer TypeScript og nødvendige avhengigheter:**  
   I terminalen, kjør følgende kommandoer:

   ```
   npm install --save typescript @types/node @types/react @types/react-dom @types/jest
   ```

2. **Initialiser en TypeScript konfigurasjonsfil:**  
   Kjør følgende kommando:

   ```
   npx tsc --init
   ```

   Dette vil opprette en `tsconfig.json` fil i rotkatalogen av prosjektet.

3. **Konfigurer tsconfig for React:**  
   Åpne `tsconfig.json` og gjør følgende endringer:

   ```
   {
     'compilerOptions': {
       'target': 'es5',
       'lib': ['dom', 'dom.iterable', 'esnext'],
       'allowJs': true,
       'skipLibCheck': true,
       'esModuleInterop': true,
       'allowSyntheticDefaultImports': true,
       'strict': true,
       'forceConsistentCasingInFileNames': true,
       'noFallthroughCasesInSwitch': true,
       'module': 'esnext',
       'moduleResolution': 'node',
       'resolveJsonModule': true,
       'isolatedModules': true,
       'noEmit': true,
       'jsx': 'react-jsx'
     },
     'include': ['src/**/*.ts', 'src/**/*.tsx'],
     'exclude': ['node_modules']
   }
   ```

4. **Endre filendelser fra `.js` til `.tsx` for React-komponenter:**  
   Dette signaliserer til TypeScript kompileren at filene inneholder JSX.

5. **Migrer en React-komponent til TypeScript:**  
   Som et eksempel, la oss ta `Profile`-komponenten fra Oppgave 1. Endre filendelsen til `.tsx` og deretter importer `React` som:

   ```typescript
   import React, { FC } from 'react';
   ```

   Deretter, definer prop-typer for `Profile`:

   ```typescript
   interface ProfileProps {
     name: string;
     age: number;
     experience: {
       title: string;
       years: number;
     }[];
   }

   const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
     // Resten av komponenten som før
   };
   ```

**Forklaring:**

Å legge til TypeScript i et eksisterende React JS-prosjekt gir sterkere type sikkerhet og kan forbedre kodekvaliteten. Den første delen av denne oppgaven fokuserer på oppsett og installasjon av nødvendige avhengigheter. `tsconfig.json` konfigurerer hvordan TypeScript kompileren skal fungere. 

De siste trinnene demonstrerer en enkel migrasjon av en React-komponent til TypeScript ved å bruke grensesnitt for props og `FC` (Functional Component) fra `React`.

[Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)  
[TypeScript and React](https://fettblog.eu/typescript-react/)


### **Løsningsforslag til Oppgave 3: Utforsking av TypeScript Typer**

**Trinnvis Løsning:**

1. **Åpne `Profile`-komponenten:**  
   Gå til filen hvor `Profile`-komponenten fra Oppgave 1 ligger. Filen skal ha endelsen `.tsx`.

2. **Importer nødvendige typer fra React:**  
   
   ```typescript
   import React, { FC } from 'react';
   ```

3. **Definer TypeScript-typer for props:**  

   ```typescript
   interface ProfileProps {
     name: string;
     age: number;
     experience: {
       title: string;
       years: number;
     }[];
   }
   ```

4. **Bruk definerte typer i komponenten:**  

   ```typescript
   const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
     // Resten av komponenten som før
   };
   ```

**Forklaring:**

Ved å definere og bruke typer for props i React-komponenter, kan man sikre at komponentene mottar og håndterer data som forventet. Hvis en komponent forventer en spesifikk type prop og noe annet blir sendt inn, vil TypeScript gi en kompileringfeil, noe som kan hjelpe med å fange opp feil tidlig i utviklingsprosessen.

Ved å bruke TypeScript, kan vi også få bedre kodeintellisens og forutsigbarhet, spesielt i større og mer komplekse React-prosjekter.

[TypeScript Basic Types](https://www.typescriptlang.org/docs/handbook/basic-types.html)  
[TypeScript in React: Props](https://fettblog.eu/typescript-react/props/)


### **Løsningsforslag til Oppgave 4: Grensesnitt (Interfaces) i TypeScript**

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `WorkExperience.tsx`.

2. **Importer nødvendige moduler fra React:**  

   ```typescript
   import React, { FC } from 'react';
   ```

3. **Definer TypeScript-grensesnittet for `WorkExperience` props:**  

   ```typescript
   interface WorkExperienceProps {
     jobTitle: string;
     companyName: string;
     startYear: Date;
     endYear: Date;
   }
   ```

4. **Bruk det definerte grensesnittet i `WorkExperience`-komponenten:**  

   ```typescript
   const WorkExperience: FC<WorkExperienceProps> = ({ jobTitle, companyName, startYear, endYear }) => {
     return (
       <div>
         <h3>{jobTitle}</h3>
         <p>{companyName}</p>
         <p>From: {startYear.toLocaleDateString()} To: {endYear.toLocaleDateString()}</p>
       </div>
     );
   };
   ```

**Forklaring:**

Ved å definere et grensesnitt for `WorkExperience`-komponentens props i TypeScript, gir vi en struktur og forventning til hvilken type data denne komponenten skal ta imot. Dette hjelper med å unngå potensielle feil ved bruk av komponenten, da TypeScript vil gi en feilmelding dersom data som ikke overholder grensesnittet blir sendt som props.

Grensesnitt er en kraftig funksjon i TypeScript som tillater utviklere å definere kontrakter for dataformater, og de fungerer spesielt godt i sammenheng med React for å definere prop-typer.

[TypeScript Interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html)  
[React and TypeScript: Props](https://fettblog.eu/typescript-react/props/)


### **Løsningsforslag til Oppgave 5: Bruk av Type Assertions**

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `UserProfile.ts`.

2. **Definer et grensesnitt for brukerprofildata:**  

   ```typescript
   interface UserProfile {
     name: string;
     age: number;
     experience: { title: string; years: number }[];
   }
   ```

3. **Opprett funksjonen `parseUserData`:**  

   ```typescript
   const parseUserData = (jsonData: string): UserProfile => JSON.parse(jsonData) as UserProfile;
   ```

**Forklaring:**

Funksjonen `parseUserData` konverterer en JSON-streng til et objekt. Ved bruk av type assertions (i dette tilfellet `as UserProfile`), forsikrer vi TypeScript om at det returnerte objektet matcher grensesnittet `UserProfile`.

Dette er nyttig når vi vet hvilken form dataen vil ha, selv om TypeScript ikke automatisk kan dedusere det. Type assertions tillater oss å spesifikt 'fortelle' TypeScript hvilken type en verdi er, forutsatt at vi vet mer enn TypeScript om den aktuelle verdien.

Merk: Mens type assertions kan være kraftige, bør de brukes varsomt. Å forsikre TypeScript feilaktig om en types form kan føre til uventede feil som er vanskelige å feilsøke.

[TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)  
[Assert function argument is a certain type in TypeScript](https://stackoverflow.com/questions/40081332/assert-function-argument-is-a-certain-type-in-typescript)


### **Løsningsforslag til Oppgave 6: Union Typer og Literal Typer**

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Filter.tsx`.

2. **Definer typer for filtrering:**  

   ```typescript
   type JobTitle = 'Developer' | 'Designer' | 'Manager';
   type FilterType = string | number;
   ```

3. **Opprett Filter-komponenten:**  

   ```typescript
   interface FilterProps {
     filterBy: FilterType;
   }

   const Filter: React.FC<FilterProps> = ({ filterBy }) => {
     if (typeof filterBy === 'string') {
       // Filtrer etter jobbtittel
       return <div>Filtering by job title: {filterBy}</div>;
     } else if (typeof filterBy === 'number') {
       // Filtrer etter årstall
       return <div>Filtering by year: {filterBy}</div>;
     } else {
       return null;
     }
   };
   ```

**Forklaring:**

Vi starter med å definere `JobTitle` som en literal type. Dette betyr at den kan være en av tre strenger: 'Developer', 'Designer', eller 'Manager'. Vi definerer deretter `FilterType` som en union type, noe som betyr at den kan være enten en `string` eller et `number`.

I `Filter`-komponenten bruker vi type-sjekker (`typeof filterBy === 'string'`) for å avgjøre hvordan vi skal filtrere, basert på om `filterBy` er en streng eller et nummer. Denne tilnærmingen utnytter kraften av TypeScript for å sørge for at koden vår er type-sikker og gir forventet oppførsel basert på hvilken type data som sendes til komponenten.

Union og literal typer i TypeScript gir fleksibilitet i definisjonen av variable typer, samtidig som de gir sterk typesikkerhet.

[TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)  
[Practical TypeScript: Union and Intersection Types](https://dzone.com/articles/practical-typescript-union-and-intersection-types)


## Ekstra utfordringsoppgaver:

### **Løsningsforslag til Oppgave 7: Generiske Typer**

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Utilities.ts`.

2. **Definer en generisk funksjon:**  

   ```typescript
   const getDetails = <T, K extends keyof T>(items: T[], key: K): T[K][] => items.map(item => item[key]);
   ```

3. **Eksempel på bruk:**  

   ```typescript
   const jobExperiences = [
     { jobTitle: 'Developer', year: 2020 },
     { jobTitle: 'Designer', year: 2019 },
   ];

   const jobTitles = getDetails(jobExperiences, 'jobTitle'); // ['Developer', 'Designer']
   ```

**Forklaring:**

I denne oppgaven har vi laget en generisk funksjon ved navn `getDetails` som returnerer detaljer fra en gitt nøkkel for hvert objekt i en array. 

Den første generiske typen, `T`, representerer en hvilken som helst type. Den andre generiske typen, `K`, er begrenset til å være en nøkkel av `T` ved hjelp av `extends keyof T`.

Ved å kalle `getDetails` med `jobExperiences`-arrayen og nøkkelen 'jobTitle', får vi en ny array som inneholder kun jobbtitlene fra `jobExperiences`.

Generiske typer tillater deg å lage fleksible funksjoner og komponenter som kan håndtere mange forskjellige datatyper samtidig som de gir type-sikkerhet.

[TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)  
[Understanding TypeScript Generics](https://www.tutorialsteacher.com/typescript/typescript-generics)