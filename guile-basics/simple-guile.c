/*
  making available the C function "user_home" 
onto scheme with the traductor function "user-home"

This function get the $HOME environment variable from
the system and shared with the scheme repl.
 */


#include <stdlib.h>
#include <libguile.h>

static SCM
user_home(void)
{
  char *s = getenv("HOME");

  if (s == NULL)
    return SCM_BOOL_F;
  else
    return scm_from_locale_string(s);
}

static void
inner_main(void *data, int argc, char **argv)
{
  scm_c_define_gsubr("user-home", 0, 0, 0, user_home);
  scm_shell(argc, argv);
}

int
main(int argc, char **argv)
{
  scm_boot_guile(argc, argv, inner_main, 0);
  return 0;
}
