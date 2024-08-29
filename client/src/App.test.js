import { render, screen } from '@testing-library/react';
import App from './App';

// we cannot directly render App as it makes call to backend component.
// in such cases we have to mock the backend component.
test('renders learn react link', () => {});
