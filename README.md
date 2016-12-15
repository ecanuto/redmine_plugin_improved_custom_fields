# Redmine Improved Custom Fields plugin

Custom fields improvements for Redmine.

## Instalation

1. Install to plugins/redmine_improved_custom_fields

```
cd redmine/plugin
git clone https://github.com/ecanuto/redmine_improved_custom_fields.git
```

2. Run 

```
rake redmine:plugins:migrate RAILS_ENV=production
```

or

```
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
```

3. Restart server

## License

Based on [Redmine Multi-Column Custom Fields Plugin](https://github.com/ande3577/redmine_multi_column_custom_fields).

Licensed under the [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html)
