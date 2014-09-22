package jp.wda.reprorper.doma;

import org.seasar.doma.jdbc.RequiresNewController;
import org.seasar.extension.tx.TransactionCallback;
import org.seasar.extension.tx.TransactionManagerAdapter;
import org.seasar.framework.container.S2Container;
import org.seasar.framework.container.factory.SingletonS2ContainerFactory;

/**
 *
 *
 *
 * @author		amnz
 */
public class S2RequiresNewController implements RequiresNewController {

	@SuppressWarnings("unchecked")
	@Override
	public <R> R requiresNew(final Callback<R> callback) throws Throwable {
		S2Container container = SingletonS2ContainerFactory.getContainer();
		TransactionManagerAdapter txAdapter = (TransactionManagerAdapter) container
				.getComponent(TransactionManagerAdapter.class);
		Object result = txAdapter.requiresNew(new TransactionCallback() {

			public Object execute(final TransactionManagerAdapter adapter)
					throws Throwable {
				return callback.execute();
			}

		});
		return (R) result;
	}

}
