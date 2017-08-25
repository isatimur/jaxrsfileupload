package xyz.isatimur.knowledgebase;

/**
 * @author Timur Isachenko {@literal <tisachenko@at-consulting.ru>} on 25.08.2017.
 */
import java.util.HashSet;
import java.util.Set;
import javax.ws.rs.core.Application;

public class Config extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new HashSet<>();
        resources.add(ServiceJaxRS.class);
        return resources;
    }
}
